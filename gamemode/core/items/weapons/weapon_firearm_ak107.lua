ITEM = class.Create("base_weapon")

ITEM.Name 				= "AK-107"
ITEM.Description 		= "A Russian-developed assault rifle introduced in the early 1990s.\n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_ak107.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 18750
ITEM.SellPrice          = 13750

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ak107",
		Model = "models/tnb/weapons/w_ak107.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AK-107 assault rifle.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_ak107_sd",
		Model = "models/tnb/weapons/w_ak107.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 5,
		Refund = 5,
		Description = "Attaches a suppressor, foregrip, and short-range optic to the weapon's frame. Sacrifice accuracy for improved handling.",
		Width = 4,
		Height = 1
	},
	PU = {
		WeaponClass = "eternity_firearm_ak107_pu",
		Model = "models/tnb/weapons/w_ak107.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "PU",
		Cost = 2,
		Refund = 2,
		Description = "Attaches a PU scope to the weapon's frame for short-medium ranged accuracy.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM