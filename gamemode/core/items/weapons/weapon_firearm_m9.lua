ITEM = class.Create("base_weapon")

ITEM.Name 				= "Beretta M9"
ITEM.Description 		= "An American semi-automatic pistol developed in the mid 1970's.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/beretta/w_m9.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m9",
		Model = "models/weapons/beretta/w_m9.mdl",
		Skin = 1,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the P99.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM