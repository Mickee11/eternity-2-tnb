ITEM = class.Create("base_clothing")

ITEM.Name 				= "Armored Jeans"
ITEM.Description 		= "A set of trousers, boots, and a bit of padding for resistance fighters. Comes in green, grey, camo, blue, light blue, and black variants."

ITEM.Model 				= Model("models/tnb/items/pants_rebel.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 3000
ITEM.SellPrice 			= 2000

ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_BASIC

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Skin = 0
			self.Variant = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Grey Variant",
		Callback = function()
			self.Skin = 0
			self.Variant = 1
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Camoflauge Variant",
		Callback = function()
			self.Skin = 0
			self.Variant = 2
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Blue Variant",
		Callback = function()
			self.Skin = 1
			self.Variant = 3
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Light Blue Variant",
		Callback = function()
			self.Skin = 1
			self.Variant = 4
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Variant",
		Callback = function()
			self.Skin = 1
			self.Variant = 5
			
			ply:HandlePlayerModel()
		end
	})

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		local skin = self.Variant or 0
		local model = "models/tnb/halflife/%s_legs_rebel1.mdl"

		if skin >= 3 then
			skin = skin - 3
			model = "models/tnb/halflife/%s_legs_rebel2.mdl"
		end

		return {
			legs = {
				Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = skin
            }
		}
	end
end

return ITEM
