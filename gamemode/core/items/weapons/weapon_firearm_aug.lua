ITEM = class.Create("base_weapon")

ITEM.Name 				= "Steyr AUG"
ITEM.Description 		= "An Austrian bullpup assault rifle dubbed the \"universal army rifle.\"\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/inss_aug/w_aug.mdl")

ITEM.Width 				= 5
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_aug",
		Model = "models/weapons/inss_aug/w_aug.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Steyr AUG assault rifle.",
		Width = 5,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM