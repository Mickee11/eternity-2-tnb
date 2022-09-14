ITEM = class.Create("base_weapon")

ITEM.Name 				= "Katana"
ITEM.Description 		= "Legendary blade."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_katana_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 8

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 10000
ITEM.SellPrice          = 8000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_katana",
		Model = "models/worldmodels/w_mw2019_katana_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the katana.",
		Width = 1,
		Height = 8
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
