ITEM = class.Create("base_ration")

ITEM.Name 				= "COTA Nutrient Pack"
ITEM.Description 		= "A small package containing the bare minimum for the backbone of the Combine army."

ITEM.Model 				= Model("models/weapons/w_package.mdl")
ITEM.Color         = Color(22, 13, 183)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"

ITEM.StoreBlock			= STOREBLOCK_INVENTORY
ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

-- 350 Total Hunger
ITEM.Contents 			= {
    "med_antifatigue"
}

ITEM.Money 				= 125

return ITEM
