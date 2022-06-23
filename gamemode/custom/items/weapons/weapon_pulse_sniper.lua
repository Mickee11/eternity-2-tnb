ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Sniper Weapon System"
ITEM.Description 		= "A heavy alien shotgun for frontal assaults.\n\nFires Pulse Type-3 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_cisr.mdl"

ITEM.Width 				= 5
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_sniper",
		Model = "models/tnb/weapons/w_cisr.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 10,
		Description = "The base model of the sniper.",
		Width = 5,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_sniper"] = true
}

return ITEM
