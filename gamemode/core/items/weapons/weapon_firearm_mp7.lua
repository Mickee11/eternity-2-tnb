ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch MP7"
ITEM.Description 		= "A German personal defense weapon produced in the very early 2000s.\n\nChambered in 4.6×30mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_mp7.mdl")
ITEM.Bodygroups         = {[1] = 0}

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 6000
ITEM.SellPrice          = 5000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mp7",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MP7.",
		Width = 2,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_mp7_sd",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 6,
		Refund = 6,
		Description = "Attaches a EOTech sight, suppressor, and extended magazine to the weapon's frame. Good for covert action.",
		Width = 3,
		Height = 1
	},
	Aimpoint = {
		WeaponClass = "eternity_firearm_mp7_aimpoint",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Aimpoint",
		Cost = 4,
		Refund = 4,
		Description = "Attaches an aimpoint sight, laser, and extended magazine to the weapon's frame. Good for short-medium range combat.",
		Width = 2,
		Height = 1
	},
	Specops = {
		WeaponClass = "eternity_firearm_mp7_specops",
		Model = "models/tnb/weapons/w_mp7.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "Special",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a compensator, holographic sight, and extended magazine to the weapon's frame. Helps improve handling.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_46x30mm"] = true
}

return ITEM