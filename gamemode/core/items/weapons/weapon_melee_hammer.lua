ITEM = class.Create("base_weapon")

ITEM.Name 				= "Hammer"
ITEM.Description 		= "A weighted tool originally intended for wood-working craftsmen."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/tnb/weapons/w_hammer.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_hammer",
		Model = "models/tnb/weapons/w_hammer.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the hammer.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
