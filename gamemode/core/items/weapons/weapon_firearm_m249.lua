ITEM = class.Create("base_weapon")

ITEM.Name 				= "M249 Light Machine Gun"
ITEM.Description 		= "An American gas operated and air-cooled squad automatic weapon.\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_inss_m249.mdl")

ITEM.Width 				= 6
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 50000
ITEM.SellPrice          = 40000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m249",
		Model = "models/weapons/w_inss_m249.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M249 LMG.",
		Width = 6,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM