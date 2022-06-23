ITEM = class.Create("base_clothing")

ITEM.Name 				= "UBC Crew Jacket"
ITEM.Description 		= "A high-visibility jacket worn by Combine employees. Waterproof."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen2.mdl")
ITEM.Skin 				= 3

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
                Model = Model(string.format("models/tnb/halflife2/%s_torso_workjacket_ubc.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
