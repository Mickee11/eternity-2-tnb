ITEM = class.Create("base_weapon")

ITEM.Name 				= "Crowbar"
ITEM.Description 		= "Favored by burglars and scientists alike.."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/kek1ch/crowbar.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_crowbar",
		Model = "models/kek1ch/crowbar.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the crowbar.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
