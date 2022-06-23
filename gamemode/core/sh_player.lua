local meta = FindMetaTable("Player")

GM.PlayerAccessors = {}

function GM:AddPlayerAccessor(name, default, mode, storetype)
	self.PlayerAccessors[name] = {
		Default = default,
		Storetype = storetype,
	}

	accessor.Player(name, default, mode)

	if SERVER then
		hook.Add("Player" .. name .. "Changed", "PlayerAccessorChanged", function(ply, old, new)
			ply:SavePlayerAccessor(name, new)
		end)
	end
end

accessor.Player("Characters", {}, ACCESSOR_SERVER)
accessor.Player("PlayerLoaded", false, ACCESSOR_SERVER)
accessor.Player("EditMode", false, ACCESSOR_SERVER)
accessor.Player("Typing", 0, ACCESSOR_SHARED)
accessor.Player("Camera", false, ACCESSOR_SHARED)
accessor.Player("AdminHidden", false, ACCESSOR_SHARED)
accessor.Player("RagdollIndex", false, ACCESSOR_SHARED)
accessor.Player("Consciousness", 100, ACCESSOR_SHARED)
accessor.Player("Restrained", false, ACCESSOR_SHARED)
accessor.Player("LastStash", NULL, ACCESSOR_SERVER)
accessor.Player("ZoneMins", false, ACCESSOR_SERVER)
accessor.Player("ZoneMaxs", false, ACCESSOR_SERVER)
accessor.Player("Gasmask", false, ACCESSOR_SERVER)
accessor.Player("APC", false, ACCESSOR_SERVER)
accessor.Player("HullData", false, ACCESSOR_SHARED)
accessor.Player("Scale", 1, ACCESSOR_SHARED)
accessor.Player("InfiniteAmmo", false, ACCESSOR_SHARED)
accessor.Player("VISR", false, ACCESSOR_SHARED)
accessor.Player("TempPermissions", 0, ACCESSOR_SHARED)

GM:AddPlayerAccessor("SpeciesWhitelist", SPECIES_HUMAN, ACCESSOR_SHARED, "INT")
GM:AddPlayerAccessor("SettingsStore", "[}", ACCESSOR_SERVER, "TEXT")
GM:AddPlayerAccessor("ToolTrust", TOOLTRUST_BASIC, ACCESSOR_SHARED, "INT")
GM:AddPlayerAccessor("AdminLevel", USERGROUP_PLAYER, ACCESSOR_SHARED, "INT")
GM:AddPlayerAccessor("Badges", 0, ACCESSOR_SHARED, "INT")
GM:AddPlayerAccessor("OOCMuted", 0, ACCESSOR_SHARED, "BOOLEAN")

-- See file: sh_donator.lua
accessor.Player("DonatorTitleText", "", ACCESSOR_SHARED)
accessor.Player("DonatorTitleColor", {}, ACCESSOR_SHARED)
accessor.Player("DonatorHidden", ACCESSOR_SHARED)
GM:AddPlayerAccessor("DonatorPackages", 0, ACCESSOR_SHARED, "INT")

-- See file: sh_permissions.lua
GM:AddPlayerAccessor("Permissions", 0, ACCESSOR_SHARED, "INT")

function meta:GetHungerRatio()
	if not self:HasCharacter() then
		return 0
	end

	local species = self:GetActiveSpecies()

	if species and species.IgnoreHungerEffects then
		return 0
	end

	return self:HungerBar() / GAMEMODE:GetConfig("HungerMax")
end

function meta:GetArmorLevel()
	return GAMEMODE:GetConfig("ArmorLevels")[self:ArmorLevel() + 1]
end

function meta:ShouldLockInput()
	if not self:HasCharacter() then
		return true
	end

	if self:Alive() and IsValid(self:GetRagdoll()) then
		return true
	end

	local wep = self:GetActiveWeapon()

	if IsValid(wep) and wep.ShouldLockInput and wep:ShouldLockInput() then
		return true
	end

	return false
end

function meta:GetZone(classname)
	self.ActiveZone = self.ActiveZone or {}

	return self.ActiveZone[classname]
end

function GM:ScalePlayerDamage(ply, hitgroup, dmg)
	if SERVER and ply:Armor() > 0 then
		ply:SetArmor(0)
	end

	local groups = GAMEMODE:GetConfig("HitGroupMultipliers")

	if groups[hitgroup] then
		dmg:ScaleDamage(groups[hitgroup])
	end

	dmg:ScaleDamage(ply:GetArmorLevel().DamageScale)
end

hook.Add("EntityTakeDamage", "player.EntityTakeDamage", function(ent, dmg)
	if not ent:IsPlayer() then
		return
	end

	local inflictor = dmg:GetInflictor()
	if not inflictor or not inflictor:IsPlayer() then
		return -- Don't scale against NPCs or the world.
	end

	if dmg:IsDamageType(DMG_CRUSH) or dmg:IsDamageType(DMG_SLASH) or dmg:IsDamageType(DMG_CLUB) then
		dmg:ScaleDamage(ent:GetArmorLevel().DamageScale)
	end
end)

hook.Add("Think", "player.Think", function()
	for _, v in pairs(player.GetAll()) do
		hook.Run("PlayerThink", v)
	end
end)

hook.Add("StartCommand", "player.StartCommand", function(ply, cmd)
	if not ply:ShouldLockInput() then
		return
	end

	cmd:ClearMovement()
	cmd:ClearButtons()
end)

hook.Add("PlayerSwitchWeapon", "player.PlayerSwitchWeapon", function(ply, old, new)
	if ply:ShouldLockInput() then
		return true
	end

	ply:HandleWeaponDraw(new)
end)
