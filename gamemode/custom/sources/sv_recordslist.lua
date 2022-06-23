netstream.Hook("RecordsListGet", function(ply, data)
	local targ = data.Target
	local char = data.CharID

	if not targ or not targ:HasCharacter() or targ:CharID() != char then
		ply:SendChat("ERROR", "That character is no longer on-server and cannot be viewed.")

		return
	end

	netstream.Send("RecordsListSend", {
		Target = targ,
		CharID = char,
		Record = targ:CitizenRecord()
	})
end)

local blacklist = {
	["combineadmin"] = true,
	["scientist_leader"] = true,
	["scientist_normal"] = true
}

netstream.Hook("RecordsListUpdateNotes", function(ply, data)
	local targ = data.Target
	local char = data.CharID
	local note = data.Notes

	if not targ or not targ:HasCharacter() or targ:CharID() != char then
		ply:SendChat("ERROR", "That character is no longer on-server and cannot be updated.")

		return
	end

	if ply == targ then
		return
	end

	if not ply:HasCombinePermission(COMBINE_RECORDS_WRITEABLE) then
		ply:SendChat("ERROR", "You do not have permission to update records")

		return
	end

	local species = targ:GetActiveSpecies()

	if species:GetClassName() == "species_vortigaunt" and targ:SpeciesState() != "free" then
		targ:SetCitizenRecord(note)
	elseif species:GetClassName() == "species_human" then
		local state = targ:SpeciesState()

		if string.StartWith(state, "citizen") then
			targ:SetCitizenRecord(note)
		elseif string.StartWith(state, "police_") then
			local flaggedLevel = species.SpeciesStates[state].Flagged.CombineLevel

			local lply = ply:SpeciesState()
			local llevel = COMBINE_LEVEL_CITIZEN
			local lstate = species.SpeciesStates[lply]

			if lstate then
				if lstate.CombineLevel then
					llevel = math.max(llevel, lstate.CombineLevel)
				end

				if lstate.Flagged and lstate.Flagged.CombineLevel and ply:IsFlagged() then
					llevel = math.max(llevel, lstate.Flagged.CombineLevel)
				end
			elseif species.SpeciesDefaults.CombineLevel then
				llevel = math.max(llevel, species.SpeciesDefaults.CombineLevel)
			end

			if flaggedLevel <= llevel then
				targ:SetCitizenRecord(note)
			end
		end
	elseif not blacklist[state] then
		targ:SetCitizenRecord(note)
	end
end)
