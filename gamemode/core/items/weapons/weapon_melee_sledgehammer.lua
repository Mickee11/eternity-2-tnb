ITEM = class.Create("base_weapon")

ITEM.Name 				= "Sledgehammer"
ITEM.Description 		= "Aged, rusted, and without it's paint. Yet it still gets the job done."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_sledgehammer_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_sledgehammer",
		Model = "models/worldmodels/w_mw2019_sledgehammer_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the sledgehammer.",
		Width = 1,
		Height = 5
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
