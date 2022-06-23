ITEM = class.Create("base_clothing")

ITEM.Name 				= "Military Pack"
ITEM.Description 		= "A spacious backpack for the well-meaning rebel fighter."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 250

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_paratus_3_day/bp_paratus_3_day_body_lod0.mdl")
			}
		}
	end
end

return ITEM
