ITEM = class.Create("base_clothing")

ITEM.Name 				= "Nazi Coat"
ITEM.Description 		= "Heil Hitler."

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
	function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_combine.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
	end

	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/cca/%s_torso_metropolice_overcoat.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
	function ITEM:PostModelData(ply, data)
		data.hands = nil

		return data
	end
end

return ITEM
