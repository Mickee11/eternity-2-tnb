ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Rifle Mk. 3"
ITEM.Description 		= "An advanced, heavy weapon of alien origin designed for sustained combat.\n\nFires Pulse Type-1 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_ar3.mdl"

ITEM.Width 				= 4
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_ar3",
		Model = "models/tnb/weapons/w_ar3.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Default",
		Cost = 0,
		Refund = 10,
		Description = "The base model of the AR3.",
		Width = 4,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_basic"] = true
}

return ITEM
