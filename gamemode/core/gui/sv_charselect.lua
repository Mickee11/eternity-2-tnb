netstream.Hook("LoadCharacter", function(ply, data)
	if not isnumber(data.ID) then
		return
	end

	if ply:Restrained() then
		return
	end

	if ply:CharID() == data.ID then
		return
	end

	local character = ply:Characters()[data.ID]

	if not ply:IsAdmin() and not character or not ply:HasSpeciesWhitelist(character.Species) then
		return
	end

	local area = GAMEMODE:WorldArea()
	local override = GAMEMODE:GetSpecies(character.Species):GetClass().OverrideWorldArea

	if override or ply:IsAdmin() then
		ply:LoadCharacter(data.ID)

		return
	end

	if area ~= WORLDAREA_NONE and area ~= character.WorldArea then
		return
	end

	ply:LoadCharacter(data.ID)
end)

netstream.Hook("DeleteCharacter", function(ply, data)
	if not isnumber(data.ID) or not ply:Characters()[data.ID] then
		return
	end

	ply:DeleteCharacter(data.ID)
end)