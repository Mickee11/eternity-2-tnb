ITEM = class.Create("base_weapon")

ITEM.Name 				= "Folding Shovel"
ITEM.Description 		= "Survival shovel. Good for setting up camp and bashing skulls in."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_etool_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_foldingshovel",
		Model = "models/worldmodels/w_mw2019_etool_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the shovel.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
