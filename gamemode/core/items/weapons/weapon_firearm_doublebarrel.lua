ITEM = class.Create("base_weapon")

ITEM.Name 				= "Double Barrel"
ITEM.Description 		= "An American double barrel, as old as time.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_doublebarrel_new.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_doublebarrel",
		Model = "models/weapons/w_doublebarrel_new.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Double Barrel.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true
}

return ITEM