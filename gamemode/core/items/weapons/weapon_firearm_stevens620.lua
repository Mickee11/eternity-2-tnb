ITEM = class.Create("base_weapon")

ITEM.Name 				= "Stevens 620"
ITEM.Description 		= "An American pump-action shotgun from the early 1900's.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_nam_stevens620.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_stevens620",
		Model = "models/weapons/w_nam_stevens620.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Stevens 620.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM