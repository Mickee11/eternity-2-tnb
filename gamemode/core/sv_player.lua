local meta = FindMetaTable("Player")

function GM:PlayerSpawn(ply)
	ply:DoSpawn()

	return true
end

function GM:PlayerDeathSound()
	return true
end

function GM:PlayerCanHearPlayersVoice()
	return false -- Fuck that
end

function GM:PlayerSpray(ply)
	return true
end

function GM:PlayerShouldTaunt(ply, act)
	return ply:IsDeveloper()
end

function GM:PlayerSwitchFlashlight(ply, enable)
	ply.LastFlashlight = ply.LastFlashlight or CurTime()

	if ply.LastFlashlight <= CurTime() then
		ply.LastFlashlight = CurTime() + 0.2

		return true
	end

	return false
end

function meta:DoSpawn(loaded, respawn)
	if respawn and not self:Alive() then
		self:Spawn()
	end

	self:Freeze(not self:HasCharacter())

	self:SetConsciousness(100)
	self:SetRestrained(false)

	self:HandleLoadout()
	self:HandlePlayerModel()
	self:HandleArmorLevel()
	self:HandleTeam()
	self:HandleMoveSpeed()
	self:HandleMisc()

	self:AllowFlashlight(true)
	self:SetCanZoom(false)
	self:SetMoveType(MOVETYPE_WALK)

	self:ClearNPCRelationships()
	self:HandleNPCRelationships()

	if self:HasCharacter() then
		local species = self:GetActiveSpecies()

		self:SetHealth(species.BaseHealth)
		self:SetMaxHealth(species.BaseHealth)

		species:OnSpawn(self)

		for _, v in pairs(self:GetEquipment()) do
			v:OnSpawn(self, loaded)
		end

		if loaded then
			local state = species.SpeciesStates[self:SpeciesState()]

			if state and state.Flagged and self:IsFlagged() then
				self:HandleFlagChange(true)
			elseif self:IsFlagged() then
				self:SetIsFlagged(false)
				self:HandleFlagChange(false)
			else
				self:HandleFlagChange(false)
			end
		end
	end

	self:HandleSpawnpoint()
end

function meta:HandleFlagChange(onduty)
	if onduty then
		self:SetLastFlagged(os.time())
	end

	self:SetActiveDescription(onduty and self:DescriptionFlagged() or self:Description())

	self:HandleTeam()
end

function meta:HandleLoadout()
	self:StripWeapons()

	if not self:HasCharacter() then
		return true
	end

	local species = self:GetActiveSpecies()

	species:Loadout(self)

	if self:ToolTrust() != TOOLTRUST_BANNED or self:IsAdmin() then
		self:Give("weapon_physgun")
		self:Give("gmod_tool")
	end

	if self:IsAdmin() then
		self:Give("eternity_admin_zonemarker")
		self:Give("eternity_admin_combinemortar")
	end

	self:SelectWeapon(species.WeaponLoadout[1])

	return true
end

function meta:HandleMisc()
	local filtered = false

	for _, v in pairs(self:GetEquipment()) do
		if v.Filtered then
			filtered = true

			break
		end
	end

	self:SetGasmask(filtered)
end

function meta:GetValidSpawns()
	local spawns = ents.FindByClass("ent_spawn")
	local tab = {}

	if not self:HasCharacter() then
		-- Bird spawns
		for _, v in pairs(spawns) do
			if v:GetTeam() == TEAM_UNASSIGNED then
				table.insert(tab, v)
			end
		end
	else
		local species = self:GetActiveSpecies()

		if not species then
			for _, v in pairs(spawns) do
				if v:GetSpawngroup() == "" and v:GetTeam() == 0 then
					table.insert(tab, v)
				end
			end
		else
			local state = species.SpeciesStates[self:SpeciesState()]
			local useteam = false

			if state then
				if state.Flagged and self:IsFlagged() and state.Flagged.UseTeamSpawn != nil and state.Flagged.UseTeamSpawn then
					useteam = true
				elseif state.UseTeamSpawn != nil and state.UseTeamSpawn then
					useteam = true
				end
			end

			if species.SpeciesDefaults.UseTeamSpawn != nil and species.SpeciesDefaults.UseTeamSpawn then
				useteam = true
			end

			if useteam then
				for _, v in pairs(spawns) do
					if v:GetTeam() == self:Team() then
						table.insert(tab, v)
					end
				end
			end

			if #tab < 1 then
				local group = self:Spawngroup()

				if group != "" then
					for _, v in pairs(spawns) do
						if v:GetSpawngroup() == group then
							table.insert(tab, v)
						end
					end
				end
			end
		end
	end

	-- Generic Spawns (we should never get here?)
	if #tab < 1 then
		for _, v in pairs(spawns) do
			if v:GetSpawngroup() == "" and v:GetTeam() == 0 then
				table.insert(tab, v)
			end
		end
	end

	return tab
end

function GM:GetSuitableSpawn(spawns, force, ply)
	for _, v in RandomPairs(spawns) do
		if IsValid(v) and v:IsSuitable(force, ply) then
			return v
		end
	end
end

function meta:HandleSpawnpoint()
	local spawns = self:GetValidSpawns()
	local spawn = GAMEMODE:GetSuitableSpawn(spawns, false, self)

	if not IsValid(spawn) then
		spawn = GAMEMODE:GetSuitableSpawn(spawns, true, self)
	end

	if not IsValid(spawn) then
		spawn = GAMEMODE:PlayerSelectSpawn(self)
	end

	local species = self:GetActiveSpecies()

	if species and species.SpawnOffset then
		self:SetDelayedPosition(spawn:GetPos() + species.SpawnOffset, Angle(0, spawn:GetAngles().y, 0))
	else
		self:SetDelayedPosition(spawn:GetPos(), Angle(0, spawn:GetAngles().y, 0))
	end
end

function meta:HandleArmorLevel()
	local level = 0

	if self:HasCharacter() then
		level = self:GetActiveSpecies().ArmorLevel

		for _, v in pairs(self:GetEquipment()) do
			if v.ArmorOverride then
				level = v.ArmorLevel

				break
			end

			level = math.Clamp(level + (v.ArmorLevel or 0), ARMOR_NONE, ARMOR_ELITE)
		end
	end

	self:SetArmorLevel(level)
end

function meta:HandleMoveSpeed()
	if not self:HasCharacter() then
		self:SetWalkSpeed(0)
		self:SetRunSpeed(0)
		self:SetJumpPower(0)
		self:SetCrouchedWalkSpeed(0)
	end

	local species = self:GetActiveSpecies()

	local consciousness = self:Consciousness() / 100
	local walk, run, jump, crouch = species:GetSpeeds(self)

	local item = self:GetEquipment(EQUIPMENT_MONSTER)

	if item and item.GetSpeeds then
		walk, run, jump, crouch = item:GetSpeeds(self)
	end

	run = math.Max(walk, run * self:GetArmorLevel().Speed * consciousness)

	if not species.IgnoreHungerEffects then
		local hunger = self:GetHungerRatio()

		if hunger < 0.1 then
			jump = jump + (jump * 0.025)
			run = run + (run * 0.1)
		elseif hunger >= 0.5 then
			jump = jump - ((jump * (hunger - 0.3)) / 2)
			walk = walk - ((walk * (hunger - 0.3)) / 2)
			run = run - ((run * (hunger - 0.3)) / 2)
		end
	end

	self:SetWalkSpeed(walk)
	self:SetRunSpeed(run)
	self:SetJumpPower(jump)
	self:SetCrouchedWalkSpeed(crouch)
end

function meta:HandleTeam()
	if not self:HasCharacter() then
		self:SetTeam(TEAM_UNASSIGNED)

		return
	end

	local species = self:GetActiveSpecies()
	local state = species.SpeciesStates[self:SpeciesState()]

	local playerteam = species.Team
	local disallow = nil

	if state then
		if state.Flagged and self:IsFlagged() and state.Flagged.ForceTeam then
			playerteam = state.Flagged.ForceTeam

			if state.Flagged.DisallowTeamItems != nil then
				disallow = state.Flagged.DisallowTeamItems
			end
		elseif state.ForceTeam then
			playerteam = state.ForceTeam

			if state.DisallowTeamItems != nil then
				disallow = state.DisallowTeamItems
			end
		end
	end

	if species.SpeciesDefaults.ForceTeam then
		playerteam = species.SpeciesDefaults.ForceTeam

		if species.SpeciesDefaults.DisallowTeamItems != nil and disallow != nil then
			disallow = species.SpeciesDefaults.DisallowTeamItems
		end
	end

	if not disallow then
		for _, v in pairs(self:GetEquipment()) do
			if v.Team then
				playerteam = v.Team
			end
		end
	end

	self:SetTeam(playerteam)
	self:ClearNPCRelationships()
end

function meta:SetDelayedPosition(pos, ang)
	self.DelayedPos = pos
	self.DelayedAng = ang
end

hook.Add("PlayerDeath", "player.PlayerDeath", function(ply, inflictor, attacker)
	for _, v in pairs(ply:GetEquipment()) do
		v:OnDeath(ply)
	end

	entsound.Clear(ply)

	ply:GetActiveSpecies():OnDeath(ply)
end)

hook.Add("PlayerArmorLevelChanged", "player.PlayerArmorLevelChanged", function(ply, old, new)
	ply:HandleMoveSpeed()
end)

hook.Add("PlayerConsciousnessChanged", "player.PlayerConsciousnessChanged", function(ply, old, new)
	ply:HandleMoveSpeed()
end)

hook.Add("PlayerButtonDown", "player.PlayerButtonDown", function(ply, button)
	ply.LastActivity = CurTime()
end)

hook.Add("PlayerThink", "player.PlayerThink", function(ply)
	local afk = GAMEMODE:GetConfig("AFKKicker")

	if afk.Enabled and (#player.GetAll() / game.MaxPlayers()) > afk.Threshold and not ply:IsAdmin() then
		ply.LastActivity = ply.LastActivity or CurTime()

		if CurTime() - ply.LastActivity > afk.Timer then
			GAMEMODE:WriteLog("security_inactivity", {
				Ply = GAMEMODE:LogPlayer(ply)
			})

			game.KickID(ply:UserID(), "Kicked for inactivity")
		end
	end

	if ply.DelayedPos then
		ply:SetPos(ply.DelayedPos)
		ply.DelayedPos = nil
	end

	if ply.DelayedAng then
		ply:SetEyeAngles(ply.DelayedAng)
		ply.DelayedAng = nil
	end
end)

function GM:DoPlayerDeath(ply, attacker, dmg)
	for k,v in pairs(ply:GetWeapons()) do
		if IsValid(v) and v.OnDeath then
			v:OnDeath()
		end
	end

	if attacker:IsPlayer() and self:GetConfig("DropOnDeath") then
		local weapon = ply:GetActiveWeapon()

		if IsValid(weapon) and weapon.GetItem then
			local item = weapon:GetItem()

			if item and not item.NoDrop then
				local inventory = item:GetInventory()

				inventory:RemoveItem(item)

				item:SetWorldItem(ply:EyePos(), Angle())
			end
		end
	end

	if not IsValid(ply:GetRagdoll()) then
		ply:CreateRagdoll()
	end

	if IsValid(attacker) and attacker:IsPlayer() and attacker != ply then
		local weapon = dmg:GetInflictor()

		if not IsValid(weapon) then
			return
		end

		if weapon:IsPlayer() and IsValid(weapon:GetActiveWeapon()) then
			weapon = weapon:GetActiveWeapon()
		end

		self:WriteLog("sandbox_kill", {
			Ply = self:LogPlayer(attacker),
			Char = self:LogCharacter(attacker),
			VictimPly = self:LogPlayer(ply),
			VictimChar = self:LogCharacter(ply),
			Weapon = weapon:GetClass()
		})
	end
end

function GM:CanPlayerSuicide(ply)
	if not ply:HasCharacter() then
		return false
	end

	if ply:Restrained() then
		return false
	end

	return true
end

function GM:GetFallDamage(ply, speed)
	if ply:GetActiveSpecies().NoFallDamage then
		return 0
	end

	return self.BaseClass:GetFallDamage(ply, speed)
end
