ITEM = class.Create("base_clothing")

ITEM.Name 				= "Canvas Jacket"
ITEM.Description 		= "A large, brown jacket with more than a few pockets."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_jacket_brown.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 200
ITEM.SellPrice 			= 95

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_jacket_brown.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
