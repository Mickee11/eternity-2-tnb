ITEM = class.Create("base_weapon")

ITEM.Name 				= "SKS"
ITEM.Description 		= "A Soviet-developed self-loading carbine developed in the mid-1940s.\n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/sks_ins/w_sks.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sks",
		Model = "models/weapons/sks_ins/w_sks.mdl",
		Skin = 1,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SKS.",
		Width = 1,
		Height =6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM