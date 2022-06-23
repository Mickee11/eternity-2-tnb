ITEM = class.Create("base_weapon")

ITEM.Name 				= "Galil ARM"
ITEM.Description 		= "An Israeli made automatic rifle designed in the late 1960s.\n\nChambered in 7.62x51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_galil.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_galil",
		Model = "models/tnb/weapons/w_galil.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Galil ARM.",
		Width = 3,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_galil_sd",
		Model = "models/tnb/weapons/w_galil.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 5,
		Refund = 5,
		Description = "Attaches a Acog scope and suppressor to the weapon's frame. Good for medium-ranged, covert action.",
		Width = 4,
		Height = 1
	},
	DMR = {
		WeaponClass = "eternity_firearm_galil_dmr",
		Model = "models/tnb/weapons/w_galil.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "DMR",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a telescopic scope to the weapon's frame for long ranged accuracy.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM