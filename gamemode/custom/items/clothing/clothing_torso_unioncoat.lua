ITEM = class.Create("base_clothing")

ITEM.Name 				= "Union Coat"
ITEM.Description 		= "A thick, black coat sporting Union symbology."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen1.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_union_wintercoat.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
