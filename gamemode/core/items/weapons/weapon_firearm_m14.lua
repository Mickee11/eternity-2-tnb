ITEM = class.Create("base_weapon")

ITEM.Name 				= "M14 EBR"
ITEM.Description 		= "Semi-Automatic marksman rifle developed by the United States in the early 2000's.\n\nChambered in 7.62x51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/ebr_14/w_m14.mdl")

ITEM.Width 				= 6
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m14",
		Model = "models/weapons/ebr_14/w_m14.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M14 EBR.",
		Width = 6,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM