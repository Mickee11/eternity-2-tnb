ITEM = class.Create("base_weapon")

ITEM.Name 				= "Metal Bat"
ITEM.Description 		= "Crucial part to America's favorite past time."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/worldmodels/w_mw2019_metalbat_wm.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 5

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 500
ITEM.SellPrice          = 400

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_metalbat",
		Model = "models/worldmodels/w_mw2019_metalbat_wm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the metal bat.",
		Width = 1,
		Height = 5
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
