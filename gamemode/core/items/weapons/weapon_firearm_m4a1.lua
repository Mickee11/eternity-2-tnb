ITEM = class.Create("base_weapon")

ITEM.Name 				= "M4A1"
ITEM.Description 		= "An air-cooled, gas-operated automatic carbine; a lighter version of the M16A2 Rifle.\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_m4.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 20000
ITEM.SellPrice          = 15000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m4a1",
		Model = "models/tnb/weapons/w_m4.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M4A1.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_m4a1_sd",
		Model = "models/tnb/weapons/w_m4.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 5,
		Refund = 5,
		Description = "Attaches a suppressor, foregrip, and holographic sight to the weapon's frame. Sacrifice accuracy for better handling.",
		Width = 4,
		Height = 1
	},
	CMag = {
		WeaponClass = "eternity_firearm_m4a1_cmag",
		Model = "models/tnb/weapons/w_m4.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "C-Mag",
		Cost = 9,
		Refund = 9,
		Description = "Attaches a C-Magazine, foregrip, and aimpoint sight to the weapon's frame. Good for sustained combat.",
		Width = 3,
		Height = 2
	},
	Aimpoint = {
		WeaponClass = "eternity_firearm_m4a1_aimpoint",
		Model = "models/tnb/weapons/w_m4.mdl",
		Skin = 0,
		Bodygroups = {[1] = 4},
		Title = "Aimpoint",
		Cost = 2,
		Refund = 2,
		Description = "Attaches a foregrip and aimpoint sight to the weapon's frame. A straight upgrade to the base model.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM