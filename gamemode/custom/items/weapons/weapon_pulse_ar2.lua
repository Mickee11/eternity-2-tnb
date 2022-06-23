ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Rifle Mk. 2"
ITEM.Description 		= "An assault-style weapon of alien origin with selective firemodes for close quarters action.\n\nFires Pulse Type-1 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/weapons/w_irifle.mdl"

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_ar2",
		Model = "models/weapons/w_irifle.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 8,
		Description = "The base model of the AR2.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_basic"] = true
}

return ITEM
