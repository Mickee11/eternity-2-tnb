ITEM = class.Create("base_weapon")

ITEM.Name 				= "Benelli M1014"
ITEM.Description 		= "A modern American combat shotgun developed in the 1990s.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_xm.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m1014",
		Model = "models/tnb/weapons/w_xm.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M1014.",
		Width = 3,
		Height = 1
	},
	Short = {
		WeaponClass = "eternity_firearm_m1014_short",
		Model = "models/tnb/weapons/w_xm.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Short",
		Cost = 3,
		Refund = 3,
		Description = "A cut down, more easily concealed variant of the M1014.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM