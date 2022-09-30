ITEM = class.Create("base_weapon")

ITEM.Name 				= "M40A1"
ITEM.Description 		= "An American long action weapon system designed in the mid 1960's.\n\nChambered in 7.62×51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_nam_m40.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 75000
ITEM.SellPrice          = 65000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m40a1",
		Model = "models/weapons/w_nam_m40.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 3,
		Description = "The base model of the M40A1.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM