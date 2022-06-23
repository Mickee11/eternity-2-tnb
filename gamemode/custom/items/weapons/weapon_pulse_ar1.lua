ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Rifle Mk. 1"
ITEM.Description 		= "A semi-automatic weapon of alien origin built for short to medium range combat.\n\nFires Pulse Type-1 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_ar1.mdl"

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_ar1",
		Model = "models/tnb/weapons/w_ar1.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Default",
		Cost = 0,
		Refund = 5,
		Description = "The base model of the AR1.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_basic"] = true
}

return ITEM
