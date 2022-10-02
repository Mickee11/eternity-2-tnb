ITEM = class.Create("base_weapon")

ITEM.Name 				= "Armsel Striker"
ITEM.Description 		= "American Semi-Automatic shotgun designed in the late 1890's.\n\nTakes 12-Gauge."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_auto5.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 50000
ITEM.SellPrice          = 45000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_auto5",
		Model = "models/weapons/w_ins2_auto5.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Browning Auto-5.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM