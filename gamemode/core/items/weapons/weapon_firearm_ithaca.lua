ITEM = class.Create("base_weapon")

ITEM.Name 				= "Ithaca Model 37"
ITEM.Description 		= "An ancient American shotgun around the 1920s.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_ithaca.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 8000
ITEM.SellPrice          = 6000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ithaca",
		Model = "models/tnb/weapons/w_ithaca.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Ithaca Model 37.",
		Width = 3,
		Height = 1
	},
	Stakeout = {
		WeaponClass = "eternity_firearm_ithaca_stakeout",
		Model = "models/tnb/weapons/w_ithaca.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Stakeout",
		Cost = 3,
		Refund = 3,
		Description = "A cut down, more easily concealed variant of the Ithaca Model 37.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM