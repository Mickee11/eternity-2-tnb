ITEM = class.Create("base_weapon")

ITEM.Name 				= "Remington M870"
ITEM.Description 		= "An American pump-action shotgun designed in the early 2000's.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/smc/r870/w_remington_m870.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 6

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 12000
ITEM.SellPrice          = 7000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_remington870",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Remington M870.",
		Width = 1,
		Height = 6
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM