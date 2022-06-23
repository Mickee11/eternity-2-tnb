local meta = FindMetaTable("Player")

net.Receive("ArmDupe", function(len, ply)
	Msg(Format("ArmDupe called by %s!\n", ply:Name()))
end)

function GM:PlayerGiveSWEP(ply, class, tab)
	if ply:IsSuperAdmin() then
		GAMEMODE:WriteLog("sandbox_spawn_weapon", {
			Ply = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(ply),
			Class = class
		})

		return true
	end

	return false
end

function GM:PlayerSpawnSWEP(ply, class, tab)
	if ply:IsSuperAdmin() then
		GAMEMODE:WriteLog("sandbox_spawn_weapon", {
			Ply = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(ply),
			Class = class
		})

		return true
	end

	return false
end

function GM:CheckBlacklist(index, str)
	local blacklist = GAMEMODE:GetConfig("SandboxBlacklist")[index]

	for _, v in pairs(blacklist) do
		if string.find(str, v, 1, true) then
			return false
		end
	end

	return true
end

function meta:CanSpawn()
	if not self:Alive() then
		return false
	end

	return true
end

function meta:CanSpawnProp(index, mdl)
	if not self:CanSpawn() then
		return false
	end

	if not self:IsAdmin() then
		mdl = string.gsub(string.lower(mdl), "\\", "/")

		if self:ToolTrust() == TOOLTRUST_BANNED then
			return false
		end

		if not GAMEMODE:CheckBlacklist("Props", mdl) then
			return false
		end

		if not self:CheckLimits(index) then
			return false
		end

		if self.NextPropSpawn and self.NextPropSpawn > CurTime() then
			return false
		end
	end

	return true
end

function GM:PlayerSpawnProp(ply, mdl)
	return ply:CanSpawnProp("props", mdl)
end

function GM:PlayerSpawnRagdoll(ply, mdl)
	return ply:CanSpawnProp("ragdolls", mdl)
end

function GM:PlayerSpawnEffect(ply, mdl)
	return ply:CanSpawnProp("effects", mdl)
end

hook.Add("PlayerSpawnedProp", "sandbox.PlayerSpawnedProp", function(ply, mdl, ent)
	if not ply:IsAdmin() then
		local trust = ply:ToolTrust()

		if ent:BoundingRadius() > GAMEMODE:GetConfig("PropRadius")[trust] then
			ent:Remove()

			return
		end

		if trust != TOOLTRUST_ADVANCED then
			ply.NextPropSpawn = CurTime() + 1

			ent:SetCollisionGroup(COLLISION_GROUP_WORLD)
		end
	end

	ent:SetSteamID(ply:SteamID())
	ent:SetPlayerName(ply:VisibleRPName())

	GAMEMODE:WriteLog("sandbox_spawn_generic", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Mdl = mdl
	})
end)

hook.Add("PlayerSpawnedRagdoll", "sandbox.PlayerSpawnedRagdoll", function(ply, mdl, ent)
	ent:SetCollisionGroup(COLLISION_GROUP_WORLD)

	if not ply:IsAdmin() and ply:ToolTrust() != TOOLTRUST_ADVANCED then
		ply.NextPropSpawn = CurTime() + 1
	end

	ent:SetSteamID(ply:SteamID())
	ent:SetPlayerName(ply:VisibleRPName())

	GAMEMODE:WriteLog("sandbox_spawn_generic", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Mdl = mdl
	})
end)

hook.Add("PlayerSpawnedSENT", "sandbox.PlayerSpawnedSENT", function(ply, ent)
	if PERMAPROP_CLASSES[ent:GetClass()] then
		ent:SetSteamID(ply:SteamID())
		ent:SetPlayerName(ent:GetName())
	end
end)

hook.Add("PlayerSpawnedEffect", "sandbox.PlayerSpawnedEffect", function(ply, mdl, ent)
	if not ply:IsAdmin() and ply:ToolTrust() != TOOLTRUST_ADVANCED then
		ply.NextPropSpawn = CurTime() + 1
	end

	ent:SetSteamID(ply:SteamID())
	ent:SetPlayerName(ply:VisibleRPName())

	GAMEMODE:WriteLog("sandbox_spawn_generic", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Mdl = mdl
	})
end)

function GM:PlayerSpawnSENT(ply, class)
	if not ply:IsAdmin() then
		local ok = false

		for k, v in pairs(GAMEMODE:GetConfig("PermissionWhitelist")) do
			if not ply:HasPermission(k) then
				continue
			end

			if table.HasValue(v, class) then
				ok = true

				break
			end
		end

		if not ok then
			return false
		end
	end

	if not ply:CanSpawn() then
		return false
	end

	if not GAMEMODE:CheckBlacklist("Entities", class) then
		return false
	end

	GAMEMODE:WriteLog("sandbox_spawn_entity", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Class = class
	})

	return true
end

function GM:PlayerSpawnVehicle(ply, model, name, tab)
	if not ply:IsAdmin() then
		local ok = false

		for k, v in pairs(GAMEMODE:GetConfig("PermissionWhitelist")) do
			if not ply:HasPermission(k) then
				continue
			end

			if table.HasValue(v, name) then
				ok = true

				break
			end
		end

		if not ok then
			return false
		end
	end

	if not ply:CanSpawn() then
		return false
	end

	GAMEMODE:WriteLog("sandbox_spawn_vehicle", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Class = name
	})

	return true
end

function GM:PlayerSpawnNPC(ply, class, weapon)
	if not ply:IsAdmin() then
		return false
	end

	if not ply:CanSpawn() then
		return false
	end

	GAMEMODE:WriteLog("sandbox_spawn_npc", {
		Ply = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(ply),
		Class = class
	})

	return true
end

function GM:CanPlayerUnfreeze(ply, ent, phys)
	if ent:IsProtectedEntity() or (ent.CanPhys and not ent:CanPhys(ply)) then
		return false
	end

	return self.BaseClass:CanPlayerUnfreeze(ply, ent, phys)
end

hook.Add("PlayerInitialSpawn", "sandbox.PlayerInitialSpawn", function(ply)
	timer.Remove(string.format("%s.cleanup", ply:SteamID()))
end)

hook.Add("PlayerDisconnected", "sandbox.PlayerDisconnected", function(ply)
	local tab = undo.GetTable()[ply:UniqueID()]
	local uid = ply:UniqueID()

	if not tab then
		return
	end

	local steamid = ply:SteamID()

	timer.Create(string.format("%s.cleanup", steamid), GAMEMODE:GetConfig("CleanupTimer"), 1, function()
		for _, v in pairs(undo.GetTable()[uid]) do
			for _, ent in pairs(v.Entities) do
				if not IsValid(ent) or ent:PermaProp() then
					continue
				end

				ent:Remove()
			end
		end
	end)
end)

-- this shit is so fucking ridiculous im gonna call you out in comments
local PERMAPROP_CLASSES = PERMAPROP_CLASSES -- STOP TRAVERSING _G TO FIND TABLE, STORE REFERENCE!
local SPECIAL_ENTITY_HANDLER = {
	edit_fog = function(data, ent)
		data.Pos = ent:GetPos()
		data.Ang = ent:GetAngles()

		data.SteamID = ent:SteamID()
		data.PlayerName = ent:PlayerName()

		data.FogStart = ent:GetFogStart()
		data.FogEnd = ent:GetFogEnd()
		data.Density = ent:GetDensity()
		data.FogColor = ent:GetFogColor()
	end,
	edit_sun = function(data, ent)
		data.Pos = ent:GetPos()
		data.Ang = ent:GetAngles()

		data.SteamID = ent:SteamID()
		data.PlayerName = ent:PlayerName()

		data.SunSize = ent:GetSunSize()
		data.OverlaySize = ent:GetOverlaySize()
		data.SunColor = ent:GetSunColor()
		data.OverlayColor = ent:GetOverlayColor()
	end,
	edit_sky = function(data, ent)
		data.Pos = ent:GetPos()
		data.Ang = ent:GetAngles()

		data.SteamID = ent:SteamID()
		data.PlayerName = ent:PlayerName()

		data.TopColor = ent:GetTopColor()
		data.BottomColor = ent:GetBottomColor()
		data.FadeBias = ent:GetFadeBias()

		data.SunSize = ent:GetSunSize()
		data.SunNormal = ent:GetSunNormal()
		data.SunColor = ent:GetSunColor()

		data.DuskScale = ent:GetDuskScale()
		data.DuskIntensity = ent:GetDuskIntensity()
		data.DuskColor = ent:GetDuskColor()

		data.DrawStars = ent:GetDrawStars()
		data.StarTexture = ent:GetStarTexture()
		data.StarLayers = ent:GetStarLayers()
		data.StarScale = ent:GetStarScale()
		data.StarFade = ent:GetStarFade()
		data.StarSpeed = ent:GetStarSpeed()
	end,
}

local function save(master, ent)
	local str = ""
	local data = {}
	local mdl = ent

	data.Class = ent:GetClass()

	local handler = SPECIAL_ENTITY_HANDLER[data.Class]
	if handler then
		handler(data, ent)
	elseif data.Class:sub(1,5) == "prop_" then -- this is probably faster since we dont have to find the length of the string
		if data.Class == "prop_effect" then
			mdl = ent.AttachedEntity
		end

		data.Model = mdl:GetModel()
		data.Skin = mdl:GetSkin()

		data.Pos = ent:GetPos()
		data.Ang = ent:GetAngles()

		data.CollisionGroup = ent:GetCollisionGroup()

		data.RenderMode = mdl:GetRenderMode()
		data.RenderFX = mdl:GetRenderFX()

		data.Color = mdl:GetColor()

		local mat = mdl:GetMaterial()

		if mdl.MaterialData then
			data.AdvancedMaterialData = mdl.MaterialData
		else
			if #mat > 0 then
				data.Material = mat
			else
				local tab = {}

				for i = 0, 31 do
					local submat = mdl:GetSubMaterial(i)

					if #submat > 0 then
						tab[i] = submat
					end
				end

				if table.Count(tab) > 0 then -- this is retarded but the table probably isnt numerically indexed most of the time
					data.SubMaterials = tab
				end
			end
		end

		data.SteamID = ent:SteamID()
		data.PlayerName = ent:PlayerName()
		data.Description = ent:Description()
	end

	table.insert(master, data)
end

function GM:SavePermaProps()
	local data = {}

	-- straight up this is probably faster than loop inside a loop,
	-- PERMAPROP_CLASSES is even string-indexed. wtf
	for _, ent in ipairs(ents.GetAll()) do
		if not ent:PermaProp() or not PERMAPROP_CLASSES[ent:GetClass()] then continue end

		save(data, ent)
	end

	file.Write(string.format("eternity/permaprops/%s.txt", game.GetMap()), pon.encode(data))
end

function GM:LoadPermaProps()
	local FileData = file.Read(string.format("eternity/permaprops/%s.txt", game.GetMap()), "DATA")
	if not FileData or #FileData == 0 then
		return
	end

	local entities = pon.decode(FileData)
	if not entities then
		return
	end

	-- we're still in the old format
	if !entities[1] then
		entities = {} -- clear old table

		local PropData = string.Explode("\n", FileData)
		for _,encoded in next, PropData do
			local decoded = pon.decode(encoded)
			if !istable(decoded) then continue end
			if table.Count(decoded) == 0 then continue end

			table.insert(entities, decoded)
		end

		-- write with new format to disk
		file.Write(string.format("eternity/permaprops/%s.txt", game.GetMap()), pon.encode(entities))
	end

	for _, data in next, entities do
		if !PERMAPROP_CLASSES[data.Class] then continue end

		local ent = ents.Create(data.Class)

		if string.StartWith(data.Class, "prop") then
			ent:SetModel(data.Model)
			ent:SetSkin(data.Skin)
		end

		ent:SetPos(data.Pos)
		ent:SetAngles(data.Ang)

		ent:Spawn()
		ent:Activate()

		local phys = ent:GetPhysicsObject()

		if IsValid(phys) then
			phys:EnableMotion(false)
			phys:Sleep()
		end

		if string.StartWith(data.Class, "prop") then
			local mdl = data.Class == "prop_effect" and ent.AttachedEntity or ent

			ent:SetCollisionGroup(data.CollisionGroup)

			mdl:SetRenderMode(data.RenderMode)
			mdl:SetRenderFX(data.RenderFX)

			mdl:SetColor(data.Color)

			if data.AdvancedMaterialData and materials then
				local texture = data.AdvancedMaterialData.texture
				data.AdvancedMaterialData.texture = nil

				materials:Set(mdl, string.Trim(texture):lower(), data.AdvancedMaterialData)
			else
				if data.Material then
					mdl:SetMaterial(data.Material)
				elseif data.SubMaterials then
					for index, mat in pairs(data.SubMaterials) do
						mdl:SetSubMaterial(index, mat)
					end
				end
			end
		end

		if data.Class == "edit_fog" then
			ent:SetFogStart(data.FogStart)
			ent:SetFogEnd(data.FogEnd)
			ent:SetDensity(data.Density)
			ent:SetFogColor(data.FogColor)
		elseif data.Class == "edit_sun" then
			ent:SetSunSize(data.SunSize)
			ent:SetOverlaySize(data.OverlaySize)
			ent:SetSunColor(data.SunColor)
			ent:SetOverlayColor(data.OverlayColor)

			ent:OnAngleChange(ent:GetAngles())
		elseif data.Class == "edit_sky" then
			ent:SetTopColor(data.TopColor)
			ent:SetBottomColor(data.BottomColor)
			ent:SetFadeBias(data.FadeBias)

			ent:SetSunSize(data.SunSize)
			ent:SetSunNormal(data.SunNormal)
			ent:SetSunColor(data.SunColor)

			ent:SetDuskScale(data.DuskScale)
			ent:SetDuskIntensity(data.DuskIntensity)
			ent:SetDuskColor(data.DuskColor)

			ent:SetDrawStars(data.DrawStars)
			ent:SetStarTexture(data.StarTexture)
			ent:SetStarLayers(data.StarLayers)
			ent:SetStarScale(data.StarScale)
			ent:SetStarFade(data.StarFade)
			ent:SetStarSpeed(data.StarSpeed)
		end

		ent:SetSteamID(data.SteamID)
		ent:SetPlayerName(data.PlayerName or "N/A")

		if string.StartWith(data.Class, "prop") then
			ent:SetDescription(data.Description)
		end

		ent:SetPermaProp(true)
	end
end

hook.Add("InitPostEntity", "sandbox.InitPostEntity", function()
	GAMEMODE:LoadPermaProps()
end)

hook.Add("ShutDown", "sandbox.ShutDown", function()
	hook.Run("SavePermaProps")
end)

-- look, this isnt the best solution, but if you're really gonna store props on filesystem
-- you better be prepared to pay the price.
timer.Create("SavePermaProps", 300, 0, function()
	hook.Run("SavePermaProps")
end)
