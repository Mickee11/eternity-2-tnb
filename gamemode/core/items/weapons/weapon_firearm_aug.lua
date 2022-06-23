ITEM = class.Create("base_weapon")

ITEM.Name 				= "Steyr AUG"
ITEM.Description 		= "An Austrian bullpup assault rifle dubbed the \"universal army rifle.\"\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_aug.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_aug",
		Model = "models/tnb/weapons/w_aug.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Steyr AUG assault rifle.",
		Width = 3,
		Height = 1
	},
	CMag = {
		WeaponClass = "eternity_firearm_aug_cmag",
		Model = "models/tnb/weapons/w_aug.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "C-Mag",
		Cost = 7,
		Refund = 7,
		Description = "Replaces the weapon's standard magazine with a larger C-Mag drum magazine and bipod. Good for sustained combat.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM