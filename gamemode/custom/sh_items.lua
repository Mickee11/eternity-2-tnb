function GM:EternityPostLoadItems()
	self:RegisterItemFolder("items/generic/ammo")
    self:RegisterItemFolder("items/generic/radio")
    self:RegisterItemFolder("items/generic/currency")
    self:RegisterItemFolder("items/generic")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_clothing.lua")
    self:RegisterItemFolder("items/clothing")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_consumable.lua")
    self:RegisterItemFolder("items/consumables")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_ration.lua")
    self:RegisterItemFolder("items/rations")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_xenian.lua")
    self:RegisterItemFolder("items/xenian")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_vortigaunt.lua")
    self:RegisterItemFolder("items/vortigaunt")

    self:RegisterItem(includes.CurrentFolder(1) .. "items/base_combine.lua")
    self:RegisterItemFolder("items/combine")

	self:RegisterItemFolder("items/weapons")

    -- Language Books
	local curmodel = 1
	local bookmdl = {
		"models/props_lab/binderredlabel.mdl",
		"models/props_lab/bindergreenlabel.mdl",
		"models/props_lab/bindergraylabel01b.mdl",
		"models/props_lab/binderbluelabel.mdl"
	}

	for k,v in pairs(LANGUAGES) do
		if v.BlockKnowledge then
			continue
		end

		local base = includes.File(includes.CurrentFolder(1) .. "items/base_langbook.lua")

		base.Language = k

		if curmodel > 4 then
			curmodel = 1
		end

		base.Model = Model(bookmdl[curmodel])
		curmodel = curmodel + 1

		local path = "langbook_" .. string.lower(v.Name)

		class.Register(path, base)
		self.ItemClasses[path] = true
	end
end
