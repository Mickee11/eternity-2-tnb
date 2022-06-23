ITEM = class.Create("base_weapon")

ITEM.Name 				= "AKM"
ITEM.Description 		= "A Soviet-developed assault rifle introduced in the late 1950s.\n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_akm.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 20000
ITEM.SellPrice          = 15000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_akm",
		Model = "models/tnb/weapons/w_akm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the AKM assault rifle.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_akm_sd",
		Model = "models/tnb/weapons/w_akm.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a suppressor and short-range optic to the weapon's frame. Sacrifice accuracy for covert action.",
		Width = 4,
		Height = 1
	},
	RPK = {
		WeaponClass = "eternity_firearm_akm_rpk",
		Model = "models/tnb/weapons/w_akm.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "RPK",
		Cost = 8,
		Refund = 8,
		Description = "Replaces the weapon's standard magazine with a larger drum magazine and bipod. Good for sustained combat.",
		Width = 3,
		Height = 2
	},
	PSO = {
		WeaponClass = "eternity_firearm_akm_pso",
		Model = "models/tnb/weapons/w_akm.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "PSO",
		Cost = 2,
		Refund = 2,
		Description = "Attaches a PSO scope to the weapon's frame for short-medium ranged accuracy.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM