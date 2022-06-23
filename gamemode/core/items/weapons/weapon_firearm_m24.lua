ITEM = class.Create("base_weapon")

ITEM.Name 				= "M24 Sniper Weapon System"
ITEM.Description 		= "An American long action weapon system designed in the late 1980s.\n\nChambered in 7.62×51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_m24.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 75000
ITEM.SellPrice          = 65000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m24",
		Model = "models/tnb/weapons/w_m24.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 3,
		Description = "The base model of the M24 SWS.",
		Width = 4,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_m24_sd",
		Model = "models/tnb/weapons/w_m24.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 20,
		Refund = 20,
		Description = "Attaches a shorter range scope and suppressor to the weapon's frame. Good for covert action.",
		Width = 5,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM