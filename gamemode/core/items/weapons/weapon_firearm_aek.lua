ITEM = class.Create("base_weapon")

ITEM.Name 				= "AEK-971"
ITEM.Description 		= "A Russian-developed assault rifle designed in the late 1970s.\n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_aek",
		Model = "models/tnb/weapons/w_aek.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AEK-971 assault rifle.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_aek_sd",
		Model = "models/tnb/weapons/w_aek.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 7,
		Refund = 7,
		Description = "Attaches a suppressor, extended magazine, foregrip, and short-range optic to the weapon's frame. Sacrifice accuracy for improved handling.",
		Width = 4,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM