ITEM = class.Create("base_weapon")

ITEM.Name 				= "Golf Club"
ITEM.Description 		= "Dual purpose! For enjoyment, and for survival purposes."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_golfclub_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_golfclub",
		Model = "models/worldmodels/w_mw2019_golfclub_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Golf Club.",
		Width = 1,
		Height = 5
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
