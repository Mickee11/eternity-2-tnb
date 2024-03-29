ITEM = class.Create("base_weapon")

ITEM.Name 				= "Walther P99"
ITEM.Description 		= "A German semi-automatic pistol developed in the very early 1990s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_pist_p99.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_p99",
		Model = "models/weapons/w_ins2_pist_p99.mdl",
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