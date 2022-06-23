ITEM = class.Create("base_weapon")

ITEM.Name 				= "United States Flag"
ITEM.Description 		= "A torn piece of cloth sporting the United States flag attached to a rusted pipe."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/tnb/weapons/w_flag.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2000
ITEM.SellPrice          = 1500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_flag",
		Model = "models/tnb/weapons/w_flag.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the flag.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
