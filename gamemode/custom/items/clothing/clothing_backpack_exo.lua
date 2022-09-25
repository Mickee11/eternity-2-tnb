ITEM = class.Create("base_clothing")

ITEM.Name 				= "Exo Suit"
ITEM.Description 		= "Exo."

ITEM.Model 				= Model("models/gs3/test/i_exo_heavy.mdl")

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
				Model = Model("models/gs3/clothing/b_exo.mdl")
			}
		}
	end
end

return ITEM
