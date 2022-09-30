ITEM = class.Create("base_weapon")

ITEM.Name 				= "Famas F1"
ITEM.Description 		= "An French assault rifle designed in the latr 1960's.\"\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_famas.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_famas",
		Model = "models/weapons/tfa_ins2/w_famas.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the FAMAS F1.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM