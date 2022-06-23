local meta = FindMetaTable("Player")

function GM:LanguageFromCommand(cmd)
	return _G["LANG_" .. string.upper(cmd)] or LANG_NONE
end

function meta:GetLanguages()
	local tab = {}

	for k in pairs(LANGUAGES) do
		if self:HasLanguage(k) then
			table.insert(tab, k)
		end
	end

	local misc = self:GetEquipment(EQUIPMENT_MISC)

	if misc and not table.HasValue(tab, misc.Language) then
		table.insert(tab, misc.Language)
	end

	return tab
end

function meta:HasLanguage(id, nobook)
	local species = self:GetActiveSpecies()

	if species and species.UnderstandLanguages and id > LANG_ENG and not LANGUAGES[id].BlockKnowledge then
		return true
	end

	local languages = util.JSONToTable(self:Languages())

	if nobook then
		return table.HasValue(languages, LANGUAGES[id].Command)
	end

	local misc = self:GetEquipment(EQUIPMENT_MISC)

	if not misc then
		return table.HasValue(languages, LANGUAGES[id].Command)
	end

	if misc.Language == id then
		return true
	end

	return table.HasValue(languages, LANGUAGES[id].Command)
end

function meta:CanHearLanguage(id)
	if CLIENT and GAMEMODE:GetSetting("admin_speech") then
		return true
	elseif SERVER and self:GetSetting("admin_speech") then
		return true
	end

	return self:HasLanguage(id)
end

if SERVER then
	function meta:GiveLanguage(id)
		local species = self:GetActiveSpecies()

		if species and species.UnderstandLanguages and id > LANG_ENG and not LANGUAGES[id].BlockKnowledge then
			return false
		end

		if self:HasLanguage(id, true) then
			return false
		end

		local languages = util.JSONToTable(self:Languages())

		if #languages >= 8 then
			return false
		end

		table.insert(languages, LANGUAGES[id].Command)

		self:SetLanguages(util.TableToJSON(languages))

		return true
	end

	function meta:TakeLanguage(id)
		local species = self:GetActiveSpecies()

		if species and species.UnderstandLanguages and id > LANG_ENG and not LANGUAGES[id].BlockKnowledge then
			return false
		end

		if not self:HasLanguage(id, true) then
			return false
		end

		local languages = {}

		for k,v in pairs(util.JSONToTable(self:Languages())) do
			if v == LANGUAGES[id].Command then
				continue
			end

			table.insert(languages, v)
		end

		self:SetLanguages(util.TableToJSON(languages))

		return true
	end
end