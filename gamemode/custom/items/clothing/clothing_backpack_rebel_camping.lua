ITEM = class.Create("base_clothing")

ITEM.Name 				= "Wilderness Camping Pack"
ITEM.Description 		= "A tall backpack used by many outer-city dwellers."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 350
ITEM.SellPrice 			= 175

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {2, 4}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/player/backpack_baselardwild/bp_load_baselard_body_lod0.mdl"),
			}
		}
	end
end

return ITEM
