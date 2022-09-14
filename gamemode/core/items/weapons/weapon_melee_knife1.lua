ITEM = class.Create("base_weapon")

ITEM.Name 				= "Combat Blade"
ITEM.Description 		= "Combat blade, a bit dull and a little rusty."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_knife_wm.mdl"

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_knife1",
		Model = "models/worldmodels/w_mw2019_knife_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the knife.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
