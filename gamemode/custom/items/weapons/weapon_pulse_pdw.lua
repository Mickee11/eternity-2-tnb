ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Compact PDW"
ITEM.Description 		= "A lightweight, alien weapon for personal defense.\n\nFires Pulse Type-1 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_ar1.mdl"

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_pdw",
		Model = "models/tnb/weapons/w_ar1.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 4,
		Description = "The base model of the PDW.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_basic"] = true
}

return ITEM
