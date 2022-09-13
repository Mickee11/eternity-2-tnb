ITEM = class.Create("base_weapon")

ITEM.Name 				= "Glock 19"
ITEM.Description 		= "Austrian produced semi-automatic pistol designed during the late 1970's and early 1980's.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_glock19.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2800
ITEM.SellPrice          = 2100

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_glock19",
		Model = "models/weapons/tfa_ins2/w_glock19.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Glock 19.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM