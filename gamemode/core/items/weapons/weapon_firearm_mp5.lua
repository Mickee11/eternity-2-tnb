ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch MP5"
ITEM.Description 		= "A German submachine-gun developed in the late 1960s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_mp5.mdl")
ITEM.Bodygroups         = {[1] = 1}

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 5500
ITEM.SellPrice          = 4500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mp5",
		Model = "models/tnb/weapons/w_mp5.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MP5.",
		Width = 2,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_mp5_sd",
		Model = "models/tnb/weapons/w_mp5.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "SD",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a suppressor and collapsable stock to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
	Aim = {
		WeaponClass = "eternity_firearm_mp5_aimpoint",
		Model = "models/tnb/weapons/w_mp5.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "Aimpoint",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a foregrip, aimpoint sight, and collapsable stock to the weapon's frame. Improves weapon handling.",
		Width = 2,
		Height = 1
	},
	Short = {
		WeaponClass = "eternity_firearm_mp5_short",
		Model = "models/tnb/weapons/w_mp5.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "MP5K",
		Cost = 3,
		Refund = 3,
		Description = "A short, easily concealed version of the MP5 with a foregrip.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM