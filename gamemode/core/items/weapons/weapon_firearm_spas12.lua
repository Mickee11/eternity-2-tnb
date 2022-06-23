ITEM = class.Create("base_weapon")

ITEM.Name 				= "Franchi SPAS-12"
ITEM.Description 		= "An Italian powerhouse combat shotgun designed in the late 1970s.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_spas12.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 15000
ITEM.SellPrice          = 10000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_spas12",
		Model = "models/tnb/weapons/w_spas12.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SPAS-12.",
		Width = 3,
		Height = 1
	},
	Short = {
		WeaponClass = "eternity_firearm_spas12_short",
		Model = "models/tnb/weapons/w_spas12.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Folded",
		Cost = 0,
		Refund = 0,
		Description = "Folds the stock of the SPAS-12.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM