ITEM = class.Create("base_clothing")

ITEM.Name 				= "Huge Backpack"
ITEM.Description 		= "A tall, spacious backpack with plenty of spare pockets."

ITEM.Model 				= Model("models/props_c17/suitcase_passenger_physics.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_BACK}

-- ITEM.License 			= LICENSE_MISCGOODS
-- ITEM.UnitPrice 			= 600
-- ITEM.SellPrice 			= 200

ITEM.ItemGroup 			= "Clothing"

ITEM.StoreBlock			= STOREBLOCK_BACKPACK
ITEM.Inventories 		= {
	["Main"] = {4, 4}
}

function ITEM:CanDrop(ply)
	if ply:IsAdmin() then
		return true
	end

	return false
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			back = {
				Model = Model("models/player/backpack_sso/bp_sso_body_lod0.mdl")
			}
		}
	end
end

return ITEM
