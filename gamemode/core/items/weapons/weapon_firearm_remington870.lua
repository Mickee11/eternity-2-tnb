ITEM = class.Create("base_weapon")

ITEM.Name 				= "Remington 870"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/smc/r870/w_remington_m870.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_remington870DefaultStock",
		Model = "models/tnb/weapons/w_mossberg.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Remington 870.",
		Width = 6,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM