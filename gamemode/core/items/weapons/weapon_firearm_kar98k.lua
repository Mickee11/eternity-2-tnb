ITEM = class.Create("base_weapon")

ITEM.Name 				= "Kar98K"
ITEM.Description 		= "German long action weapon system designed in the mid 1930's.\n\nModified to fit 7.62×51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_k98.mdl")

ITEM.Width 				= 6
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 30000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_kar98k",
		Model = "models/weapons/tfa_ins2/w_k98.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 3,
		Description = "The base model of the Kar98K.",
		Width = 6,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM