ITEM = class.Create("base_weapon")

ITEM.Name 				= "Overwatch Tactical Shotgun"
ITEM.Description 		= "A heavy alien shotgun for frontal assaults.\n\nFires Pulse Type-2 ammunition."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= "models/tnb/weapons/w_overwatchshotgun.mdl"

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_pulse_shotgun",
		Model = "models/tnb/weapons/w_overwatchshotgun.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Default",
		Cost = 0,
		Refund = 6,
		Description = "The base model of the shotgun.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_pulse_shotgun"] = true
}

return ITEM
