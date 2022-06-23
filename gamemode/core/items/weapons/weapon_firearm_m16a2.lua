ITEM = class.Create("base_weapon")

ITEM.Name 				= "M16A2"
ITEM.Description 		= "An air-cooled, gas-operated semi-automatic rifle; a heavier version of the M4A1 Carbine.\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_m16.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m16a2",
		Model = "models/tnb/weapons/w_m16.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M16A2.",
		Width = 3,
		Height = 1
	},
	Acog = {
		WeaponClass = "eternity_firearm_m16a2_acog",
		Model = "models/tnb/weapons/w_m16.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Acog",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a foregrip and acog scope to the weapon's frame. A straight upgrade to the default model.",
		Width = 3,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM