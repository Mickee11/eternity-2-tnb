local meta = FindMetaTable("Player")

function meta:VisibleDescription()
	if not self:HasCharacter() then
		return ""
	end

	return self:ActiveDescription()
end

function meta:VisibleRPName()
	local species = self:GetActiveSpecies()

	if not species then
		return self:RPName()
	end

	local state = species.SpeciesStates[self:SpeciesState()]

	if state then
		if state.Flagged and self:IsFlagged() and state.Flagged.VisibleRPName then
			return state.Flagged.VisibleRPName(self, scoreboard)
		end

		if state.VisibleRPName then
			return state.VisibleRPName(self, scoreboard)
		end
	end

	if species.SpeciesDefaults.VisibleRPName then
		return species.SpeciesDefaults.VisibleRPName(self, scoreboard)
	end

	return self:RPName()
end

function meta:HasCombineLevel(level)
	local species = self:GetActiveSpecies()

	if not species then
		return false
	end

	local state = species.SpeciesStates[self:SpeciesState()]

	if state then
		if state.Flagged and self:IsFlagged() and state.Flagged.CombineLevel then
			return state.Flagged.CombineLevel >= level
		end

		if state.CombineLevel then
			return state.CombineLevel >= level
		end
	end

	if species.SpeciesDefaults.CombineLevel then
		return species.SpeciesDefaults.CombineLevel >= level
	end

	return false
end

function meta:HasCombinePermission(permission)
	local species = self:GetActiveSpecies()

	if not species then
		return false
	end

	local state = species.SpeciesStates[self:SpeciesState()]

	if state then
		if state.Flagged and self:IsFlagged() and state.Flagged.CombinePermissions and state.Flagged.CombinePermissions[permission] ~= nil then
			return state.Flagged.CombinePermissions[permission]
		end

		if state.CombinePermissions and state.CombinePermissions[permission] ~= nil then
			return state.CombinePermissions[permission]
		end
	end

	if species.SpeciesDefaults.CombinePermissions and species.SpeciesDefaults.CombinePermissions[permission] ~= nil then
		return species.SpeciesDefaults.CombinePermissions[permission]
	end

	return false
end

function meta:VisibleCitizenNumber()
	return string.format("%05i", self:CitizenNumber())
end
