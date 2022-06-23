ITEM = class.Create("base_weapon")

ITEM.Name 				= "Shovel"
ITEM.Description 		= "A metal-rusted and well-worn wooden tool. It's good for clearing dirt and debris."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/tnb/weapons/w_shovel.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_shovel",
		Model = "models/tnb/weapons/w_shovel.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the shovel.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
