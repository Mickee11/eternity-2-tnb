ITEM = class.Create("base_weapon")

ITEM.Name 				= "Prototype Pulse Rifle"
ITEM.Description 		= "Someone's semi-successful attempt at jury-rigging an AKM to fire pulse ammunition.\n\nFires Pulse Type-1 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_akm_elysium.mdl"

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_prototype",
		Model = "models/tnb/weapons/w_akm_elysium.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 5,
		Description = "The base model of the prototype.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_basic"] = true
}

return ITEM
