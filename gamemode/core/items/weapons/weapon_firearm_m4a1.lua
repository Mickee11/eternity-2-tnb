ITEM = class.Create("base_weapon")

ITEM.Name 				= "M4A1"
ITEM.Description 		= "An air-cooled, gas-operated automatic carbine; a lighter version of the M16A2 Rifle.\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/inss_m4a1/w_m4a1_v4.mdl")

ITEM.Width 				= 5
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 20000
ITEM.SellPrice          = 15000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m4a1",
		Model = "models/weapons/inss_m4a1/w_m4a1_v4.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M4A1.",
		Width = 5,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM