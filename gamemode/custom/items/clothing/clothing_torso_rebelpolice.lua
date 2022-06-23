ITEM = class.Create("base_clothing")

ITEM.Name 				= "Bulletproof Police Vest"
ITEM.Description 		= "A reinforced piece of armor once used by a United States police department."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 3000
ITEM.SellPrice 			= 2000

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

function ITEM:GetOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Shirt Color: Green",
		Callback = function()
			self.Skin = 0

			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Shirt Color: White",
		Callback = function()
			self.Skin = 1

			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Shirt Color: Blue",
		Callback = function()
			self.Skin = 2

			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_resistance.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin or 0,
				Bodygroups = {
					vests = 1,
				}
			}
		}
	end
end

return ITEM
