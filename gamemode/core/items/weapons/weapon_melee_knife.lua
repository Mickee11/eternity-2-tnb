ITEM = class.Create("base_weapon")

ITEM.Name 				= "Knife"
ITEM.Description 		= "A rusted, dull combat blade. It's still quite good for cutting soft materials."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/weapons/w_knife_ct.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_knife",
		Model = "models/weapons/w_knife_ct.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the knife.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
