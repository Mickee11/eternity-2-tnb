ITEM = class.Create("base_weapon")

ITEM.Name 				= "S&W 659"
ITEM.Description 		= "American produced semi-automatic pistol designed in the late 1900s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_sw659.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2800
ITEM.SellPrice          = 2100

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sw659",
		Model = "models/weapons/tfa_ins2/w_sw659.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the 659.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM