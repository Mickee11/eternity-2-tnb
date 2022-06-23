ITEM = class.Create("base_clothing")

ITEM.Name 				= "Buckled Backpack"
ITEM.Description 		= "A green sack held together by straps and buckles."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 275
ITEM.SellPrice 			= 130

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 3}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/player/backpack_vkbo/bp_baul_vkbo_body_lod0.mdl"),
			}
		}
	end
end

return ITEM
