ITEM = class.Create("base_weapon")

ITEM.Name 				= "MP-443 Grach"
ITEM.Description 		= "Russian semi-automatic pistol designed in the late 1990's.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/mp443/w_m9.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mp443",
		Model = "models/weapons/mp443/w_m9.mdl",
		Skin = 1,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the MP-443 Grach.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM