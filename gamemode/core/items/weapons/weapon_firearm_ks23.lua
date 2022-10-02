ITEM = class.Create("base_weapon")

ITEM.Name 				= "KS-23"
ITEM.Description 		= "Soviet Boomstick designed in the early 1970's.\n\nFires 23×75mmR."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_l4d2/w_ks23.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 4

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ks23",
		Model = "models/weapons/tfa_l4d2/w_ks23.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the KS-23.",
		Width = 1,
		Height = 4
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM