ITEM = class.Create("base_weapon")

ITEM.Name 				= "Intratec TEC-9"
ITEM.Description 		= "An American blowback-operated line of semi-automatic pistols designed in the 1980s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_tec9.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 3000
ITEM.SellPrice          = 2000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_tec9",
		Model = "models/tnb/weapons/w_tec9.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the TEC-9.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_tec9_sd",
		Model = "models/tnb/weapons/w_tec9.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a suppressor to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM