local meta = FindMetaTable("Player")

GM.CharacterAccessors = {}

function GM:AddCharacterAccessor(name, default, mode, storetype)
	self.CharacterAccessors[name] = {
		Default = default,
		Storetype = storetype
	}

	accessor.Player(name, default, mode)

	if SERVER then
		hook.Add("Player" .. name .. "Changed", "CharacterAccessorChanged", function(ply, old, new)
			ply:SaveCharacterAccessor(name, new)
		end)
	end
end

accessor.Player("CharID", -1, ACCESSOR_SHARED)
accessor.Player("Inventory", {}, ACCESSOR_SHARED)
accessor.Player("Gender", GENDER_OTHER, ACCESSOR_SHARED)
accessor.Player("ModelData", {}, ACCESSOR_SHARED)
accessor.Player("ArmorLevel", 0, ACCESSOR_SHARED)
accessor.Player("Squad", "", ACCESSOR_SHARED)
accessor.Player("SquadLeader", false, ACCESSOR_SHARED)
accessor.Player("ActiveDescription", "", ACCESSOR_SHARED)

GM:AddCharacterAccessor("RPName", "", ACCESSOR_SHARED, "VARCHAR(30)")
GM:AddCharacterAccessor("Description", "", ACCESSOR_SERVER, "VARCHAR(2048)")
GM:AddCharacterAccessor("DescriptionFlagged", "", ACCESSOR_SERVER, "VARCHAR(2048)")
GM:AddCharacterAccessor("IsFlagged", 0, ACCESSOR_SHARED, "BOOLEAN")
GM:AddCharacterAccessor("LastFlagged", 0, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("CharModel", "models/tnb/citizens/male_07.mdl", ACCESSOR_SHARED, "VARCHAR(256)")
GM:AddCharacterAccessor("CharSkin", 0, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("Species", SPECIES_HUMAN, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("SpeciesState", "", ACCESSOR_SHARED, "VARCHAR(32)")
GM:AddCharacterAccessor("Languages", "[\"eng\"]", ACCESSOR_SHARED, "VARCHAR(128)") -- First language defined
GM:AddCharacterAccessor("ActiveLanguage", LANG_NONE, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("BusinessLicenses", 0, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("InitialSetup", 0, ACCESSOR_SERVER, "BOOLEAN")
GM:AddCharacterAccessor("Spawngroup", "", ACCESSOR_SERVER, "VARCHAR(30)")
GM:AddCharacterAccessor("Hidden", 0, ACCESSOR_SHARED, "BOOLEAN")
GM:AddCharacterAccessor("CitizenNumber", 0, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("CitizenRecord", "", ACCESSOR_SERVER, "VARCHAR(2048)")
GM:AddCharacterAccessor("CombineSquad", "UNASSIGNED", ACCESSOR_SHARED, "VARCHAR(32)")
GM:AddCharacterAccessor("CombineRank", 4, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("LastRationTime", 0, ACCESSOR_SHARED, "INT")
GM:AddCharacterAccessor("HungerBar", 0, ACCESSOR_SHARED, "FLOAT")
GM:AddCharacterAccessor("WorldArea", WORLDAREA_CITY, ACCESSOR_SHARED, "INT")

function GM:CheckNameValidity(name, characters)
	if not characters then
		characters = self:GetConfig("AllowedCharacters")
	end

	for _, v in pairs(string.Explode("", name)) do
		if not string.find(characters, v, 1, true) then
			return false
		end
	end

	return true
end

function meta:HasCloak()
	local gear = self:GetEquipment(EQUIPMENT_COMBINE)

	return gear and gear:GetClassName() == "soldier_specops"
end

function GM:CheckCharacterValidity(species, data)
	if not self:IsPropertyDisabled(species, "RPName") then
		local name = tostring(data.RPName) or ""
		local min, max = self:GetConfig("MinNameLength"), self:GetConfig("MaxNameLength")

		if #name < min then
			return false, string.format("Name must be longer than %s characters", min)
		elseif #name > max then
			return false, string.format("Name can't be longer than %s characters", max)
		end

		if not self:CheckNameValidity(name) then
			return false, "Name contains invalid characters"
		end
	end

	if not self:IsPropertyDisabled(species, "Description") then
		local desc = tostring(data.Description) or ""
		local max = self:GetConfig("MaxDescLength")

		if #desc > max then
			return false, string.format("Description can't be longer than %s characters", max)
		end
	end

	if not self:IsPropertyDisabled(species, "SecondLanguage") then
		if not LANGUAGES[data.CharLanguage] then
			if data.CharLanguage ~= LANG_NONE then
				return false, "You have selected in invalid language."
			end
		elseif LANGUAGES[data.CharLanguage].BlockKnowledge then
			return false, "You have selected in invalid language."
		end
	end

	local valid = false

	for _, v in pairs(species.PlayerModels) do
		if data.CharModel == v then
			valid = true

			break
		end
	end

	if not valid then
		return false, "Invalid model"
	end

	if data.CharSkin < 0 or (CLIENT and data.CharSkin > NumModelSkins(data.CharModel)) then
		return false, "Invalid skin"
	end

	return true
end

function GM:GetPlayerByCharID(id)
	for _, v in pairs(player.GetAll()) do
		if v:CharID() == id then
			return v
		end
	end
end

function meta:HasCharacter()
	return self:CharID() != -1
end

function meta:CharacterCount()
	return table.Count(self:Characters())
end

function meta:GetExamineRange(visible)
	if visible and GAMEMODE.Flashbang - CurTime() > 2 then
		return 0
	end

	local range = GAMEMODE:GetConfig("ExamineRange")
	local weapon = self:GetActiveWeapon()

	if IsValid(weapon) and weapon.GetExamineRange then
		range = weapon:GetExamineRange(range)
	end

	return range
end

hook.Add("PlayerSpawnDataChanged", "character.PlayerSpawnDataChanged", function(ply, old, new)
	ply.SpawnData = pon.decode(new)
end)
