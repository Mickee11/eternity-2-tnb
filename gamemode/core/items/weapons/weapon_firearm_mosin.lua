ITEM = class.Create("base_weapon")

ITEM.Name 				= "Mosin Nagant"
ITEM.Description 		= "A bolt-action rifle designed by the Russian Empire designed in the late 1890s.\n\nChambered in 7.62x54mmR."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_mosin_nagant.mdl")

ITEM.Width 				= 8
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 20000
ITEM.SellPrice          = 15000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mosin",
		Model = "models/weapons/w_ins2_mosin_nagant.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Mosin.",
		Width = 8,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x54mmR"] = true
}

return ITEM