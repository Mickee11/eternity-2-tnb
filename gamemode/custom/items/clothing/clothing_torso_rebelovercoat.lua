ITEM = class.Create("base_clothing")

ITEM.Name 				= "Resistance Overcoat"
ITEM.Description 		= "A dirty, old overcoat with resistance vest over it."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.ArmorLevel 		= ARMOR_HEAVY

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 8000
ITEM.SellPrice 			= 7000

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_rebel_dark3.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
