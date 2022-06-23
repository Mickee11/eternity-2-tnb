ITEM = class.Create("base_weapon")

ITEM.Name 				= "Serbu Super-Shorty"
ITEM.Description 		= "A compact, stockless, pump action shotgun designed by the United States in the late 1980s.\n\nTakes 12-Gauge."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_shorty.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 5000
ITEM.SellPrice          = 4000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_supershorty",
		Model = "models/tnb/weapons/w_shorty.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Super-Shorty.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM