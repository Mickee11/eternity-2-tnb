ITEM = class.Create("base_weapon")

ITEM.Name 				= "Pitchfork"
ITEM.Description 		= "A must on every farm around the globe."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_pitchfork_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_pitchfork",
		Model = "models/worldmodels/w_mw2019_pitchfork_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the pitchfork.",
		Width = 1,
		Height = 5
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
