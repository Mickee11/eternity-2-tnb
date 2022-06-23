ITEM = class.Create("base_weapon")

ITEM.Name 				= "Combine Stunbaton"
ITEM.Description 		= "A standard-issue Combine crowd control implement."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/w_stunbaton.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.WeaponClass 		= "eternity_melee_stunstick"

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_stunstick",
		Model = "models/weapons/w_stunbaton.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Stunbaton.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
