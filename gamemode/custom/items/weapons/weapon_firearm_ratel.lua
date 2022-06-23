ITEM = class.Create("base_weapon")

ITEM.Name 				= "Ratel Compact Shotgun"
ITEM.Description 		= "A small compact shotgun of Combine design.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_alyx_shotgun.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ratel",
		Model = "models/tnb/weapons/w_alyx_shotgun.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Ratel.",
		Width = 2,
		Height = 1
	}
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true
}

return ITEM
