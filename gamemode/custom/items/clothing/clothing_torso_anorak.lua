ITEM = class.Create("base_clothing")

ITEM.Name 				= "Anorak Jacket"
ITEM.Description 		= "A dark-grey jacket with a brown, padded interior design. Built for snow."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_jacket_black.mdl")
ITEM.Color 				= Color(109, 109, 109)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 70

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_anorak.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
