ITEM = class.Create("base_weapon")

ITEM.Name 				= "Beretta M9"
ITEM.Description 		= "An Italian produced semi-automatic pistol designed in the 1980s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/beretta/w_m9.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1950
ITEM.SellPrice          = 1350

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m9",
		Model = "models/weapons/beretta/w_m9.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Beretta M9.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM