ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch G36 Compact"
ITEM.Description 		= "A German assault weapon designed in the very early 2000s.\n\nChambered in 5.56x45mm.."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_g36c.mdl")
ITEM.Skin               = 0

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_g36c",
		Model = "models/tnb/weapons/w_g36c.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the G36 Compact.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_g36c_sd",
		Model = "models/tnb/weapons/w_g36c.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 5,
		Refund = 5,
		Description = "Attaches a suppressor, foregrip, and holographic sight the weapons frame. Sacrifice accuracy for improved handling.",
		Width = 4,
		Height = 1
	},
	CMag = {
		WeaponClass = "eternity_firearm_g36c_cmag",
		Model = "models/tnb/weapons/w_g36c.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "C-Mag",
		Cost = 9,
		Refund = 9,
		Description = "Attaches a C-Mag, foregrip, and aimpoint sight the weapons frame. Good for sustained combat.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}


return ITEM