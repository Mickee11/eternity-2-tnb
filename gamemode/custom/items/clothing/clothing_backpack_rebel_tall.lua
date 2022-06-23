ITEM = class.Create("base_clothing")

ITEM.Name 				= "Purple Hiker's Pack"
ITEM.Description 		= "A tall backpack often used by hikers and traders."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 700
ITEM.SellPrice 			= 325

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 4}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_pilgrim/bp_piligrimm_body_lod0.mdl")
			}
		}
	end
end

return ITEM
