ITEM = class.Create("base_weapon")

ITEM.Name 				= "Machete"
ITEM.Description 		= "A large, sharpened blade intended for clearing thick brush and woodland growth."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/tnb/weapons/w_machete.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_machete",
		Model = "models/tnb/weapons/w_machete.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the machete.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
