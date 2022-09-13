ITEM = class.Create("base_weapon")

ITEM.Name 				= "Sig Sauer P226"
ITEM.Description 		= "A Swiss produced semi-automatic pistol designed in the early 1980s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/p226/w_p226.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1950
ITEM.SellPrice          = 1350

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_p226",
		Model = "models/weapons/p226/w_p226.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the P226.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM