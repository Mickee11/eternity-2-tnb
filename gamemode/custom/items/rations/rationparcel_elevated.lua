ITEM = class.Create("base_ration")

ITEM.Name 				= "Elevated-Priority Ration"
ITEM.Description 		= "A small package containing a generous collection of basic living supplies."

ITEM.Model 				= Model("models/weapons/w_package.mdl")
ITEM.Color         = Color(127, 255, 159)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"

ITEM.StoreBlock			= STOREBLOCK_INVENTORY
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

-- 300 Total Hunger
ITEM.Contents 			= {
    "food_smallbread",
    "food_crackers",
    "food_breenwater"
}

ITEM.Money 				= 100

return ITEM
