ITEM = class.Create("base_weapon")

ITEM.Name 				= "M40"
ITEM.Description 		= "A bolt-action rifle designed by the United States in the mid 1960's.\n\nChambered in 7.62x51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_nam_m40.mdl")

ITEM.Width 				= 8
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 20000
ITEM.SellPrice          = 15000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m40a1",
		Model = "models/weapons/w_nam_m40.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M40.",
		Width = 8,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM