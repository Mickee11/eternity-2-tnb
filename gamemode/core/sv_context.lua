netstream.Hook("RunEntityFunction", function(ply, data)
	local ent = data.Ent
	local name = data.Name
	local val = data.Value

	if not IsValid(ent) then
		return
	end

	local interact = ent:WithinInteractRange(ply) and not ply:Restrained()

	for _, v in pairs(ent:GetOptions(ply, interact)) do
		if v.Name == tostring(name) then
			v.Callback(val)
		end
	end
end, {
	Ent = {Type = TYPE_ENTITY},
	Name = {Type = TYPE_STRING},
	Value = {Type = true, Optional = true}
})

netstream.Hook("RunAdminFunction", function(ply, data)
	local name = data.Name
	local val = data.Value

	for _, v in pairs(ply:GetAdminOptions()) do
		if v.Name == tostring(name) then
			v.Callback(val)
		end
	end
end, {
	Name = {Type = TYPE_STRING},
	Value = {Type = true, Optional = true}
})

netstream.Hook("PlayVoiceline", function(ply, data)
	local voicelines = ply:GetActiveSpecies():GetVoicelines(ply)

	if not voicelines then
		return
	end

	local snd = voicelines[data.Voiceline]

	if snd then
		if istable(snd) then
			snd = table.Random(snd)
		end

		entsound.Play(ply, ENTSOUND_ACTION, snd)

		for k,v in pairs(ents.FindInPVS(ply)) do
			if not IsValid(v) or not v:IsPlayer() then
				return
			end

			v:PrintMessage(HUD_PRINTCONSOLE, ply:VisibleRPName() .. " played voiceline: " .. snd)
		end
	end
end, {
	Submenu = {Type = TYPE_STRING, Optional = true},
	Voiceline = {Type = TYPE_STRING}
})

netstream.Hook("PlayGesture", function(ply, data)
	local gestures = ply:GetActiveSpecies():GetGestures(ply)

	if data.Submenu then
		gestures = gestures[data.Submenu]
	end

	if not gestures then
		return
	end

	local gesture = gestures[data.Gesture]

	if gesture and IsValid(ply) and ply:IsPlayer() then
		netstream.Send("PlayGesture", {
			Gesture = gesture,
			Player = ply
		})
	end
end, {
	Submenu = {Type = TYPE_STRING, Optional = true},
	Gesture = {Type = TYPE_STRING}
})

netstream.Hook("RequestServerTransition", function(ply, data)
	local zone = nil

	for k,v in pairs(ents.FindByClass("ent_zone_transition")) do
		if v:GetEntityID() == data.Zone then
			zone = v

			break
		end
	end

	if zone == nil then
		return
	end

	if zone:PlayerInside(ply) then
		ply:SetWorldArea(zone:GetTransition())
		
		local spawngroup = zone:GetSpawnGroup()

		if spawngroup ~= nil and spawngroup ~= "" then
			ply:SetSpawngroup(spawngroup)
		end

		GAMEMODE:WriteLog("character_changezone", {
			Ply = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(ply),
			WorldArea = zone:GetTransition()
		})

		netstream.Send("AcceptServerTransition", {
			Address = WORLDAREAS[zone:GetTransition()].Address
		}, ply)
	end
end)
