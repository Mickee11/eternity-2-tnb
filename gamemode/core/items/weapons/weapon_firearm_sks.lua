ITEM = class.Create("base_weapon")

ITEM.Name 				= "SKS"
ITEM.Description 		= "A Soviet-developed self-loading carbine developed in the mid-1940s.\n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_sks.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sks",
		Model = "models/tnb/weapons/w_sks.mdl",
		Skin = 1,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SKS.",
		Width = 3,
		Height = 1
	},
	PU = {
		WeaponClass = "eternity_firearm_sks_pu",
		Model = "models/tnb/weapons/w_sks.mdl",
		Skin = 1,
		Bodygroups = {[1] = 1},
		Title = "PU",
		Cost = 2,
		Refund = 2,
		Description = "Attaches a PU scope to the weapon's frame and loads a smaller magazine. Good for short-medium range action.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true
}

return ITEM