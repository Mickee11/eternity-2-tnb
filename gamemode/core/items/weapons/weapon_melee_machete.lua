ITEM = class.Create("base_weapon")

ITEM.Name 				= "Machete"
ITEM.Description 		= "A large, sharpened blade intended for clearing thick brush and woodland growth."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_machete_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_machete",
		Model = "models/worldmodels/w_mw2019_machete_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the machete.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
