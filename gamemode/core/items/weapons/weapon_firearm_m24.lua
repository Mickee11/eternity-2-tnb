ITEM = class.Create("base_weapon")

ITEM.Name 				= "M24"
ITEM.Description 		= "An American long action weapon system designed in the late 1980s.\n\nChambered in 7.62×51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/smc/m24/w_m24.mdl")

ITEM.Width 				= 6
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 30000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m24",
		Model = "models/weapons/smc/m24/w_m24.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 3,
		Description = "The base model of the M24.",
		Width = 6,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM