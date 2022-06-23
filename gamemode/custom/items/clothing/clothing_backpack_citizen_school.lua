ITEM = class.Create("base_clothing")

ITEM.Name 				= "School Backpack"
ITEM.Description 		= "An old backpack once favored by America's youth."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 70

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {3, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
                Model = Model("models/player/backpack_tactical/tactical_backpack_d.mdl"),
			}
		}
	end
end

return ITEM
