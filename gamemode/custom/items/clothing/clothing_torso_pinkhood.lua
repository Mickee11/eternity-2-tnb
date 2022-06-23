ITEM = class.Create("base_clothing")

ITEM.Name 				= "Hooded Jacket"
ITEM.Description 		= "Remarkably off-white; Likely a victim of the colored laundry bin. Comes with a black undershirt."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_hoodedjacket.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 175
ITEM.SellPrice 			= 85

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_hoodedjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
