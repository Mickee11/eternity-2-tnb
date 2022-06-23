ITEM = class.Create("base_ration")

ITEM.Name 				= "Non-Priority Ration"
ITEM.Description 		= "A small package containing only the bear minimums."

ITEM.Model 				= Model("models/weapons/w_package.mdl")
ITEM.Color              = Color(127, 255, 0)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"

ITEM.StoreBlock			= STOREBLOCK_INVENTORY
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

-- 100 Total Hunger
ITEM.Contents 			= {
    "food_sustenancebar",
    "food_caloriepaste"
}

ITEM.Money 				= 50

return ITEM
