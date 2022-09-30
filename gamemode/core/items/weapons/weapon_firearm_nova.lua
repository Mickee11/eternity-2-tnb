ITEM = class.Create("base_weapon")

ITEM.Name 				= "Benelli Nova"
ITEM.Description 		= "An American pump-action shotgun designed in the late 1990's.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_nova.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_nova",
		Model = "models/weapons/tfa_ins2/w_nova.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Benelli Nova.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM