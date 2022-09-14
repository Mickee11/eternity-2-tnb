ITEM = class.Create("base_weapon")

ITEM.Name 				= "Baton"
ITEM.Description 		= "Beating stick favored by the old world."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_baton_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_baton",
		Model = "models/worldmodels/w_mw2019_baton_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the baton.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
