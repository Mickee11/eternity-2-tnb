ITEM = class.Create("base_weapon")

ITEM.Name 				= "Shank"
ITEM.Description 		= "A makeshift stabbing instrument build from a cut down screwdriver and tape."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/tnb/weapons/w_shank.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 100
ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_shank",
		Model = "models/tnb/weapons/w_shank.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the shank.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
