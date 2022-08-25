ITEM = class.Create("base_clothing")

ITEM.Name 				= "Small School Bag"
ITEM.Description 		= "Back to school! All a student will ever need."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model(string.format("models/eternity/clothing/%s_backpack_black.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
