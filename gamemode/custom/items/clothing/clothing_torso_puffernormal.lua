ITEM = class.Create("base_clothing")

ITEM.Name 				= "Puffer Jacket"
ITEM.Description 		= "Warm and cozy."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 130
ITEM.SellPrice 			= 55

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/mist/jacket/%s_puffer.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
