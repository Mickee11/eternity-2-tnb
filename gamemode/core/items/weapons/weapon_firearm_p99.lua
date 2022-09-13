ITEM = class.Create("base_weapon")

ITEM.Name 				= "Walther P99"
ITEM.Description 		= "An German semi-automatic pistol designed in the late 1990s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_pist_p99.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1950
ITEM.SellPrice          = 1350

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_p99",
		Model = "models/weapons/w_ins2_pist_p99.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Walther P99.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM