ITEM = class.Create("base_ration")

ITEM.Name 				= "Standard-Priority Ration"
ITEM.Description 		= "A small package containing a selection of basic living supplies."

ITEM.Model 				= Model("models/weapons/w_package.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"

ITEM.StoreBlock			= STOREBLOCK_INVENTORY
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

-- 250 Total Hunger
ITEM.Contents 			= {
    "food_sustenancebar",
    "food_caloriepaste"
}

ITEM.Money 				= 75

return ITEM
