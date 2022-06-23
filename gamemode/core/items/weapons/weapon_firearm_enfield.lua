ITEM = class.Create("base_weapon")

ITEM.Name 				= "Lee–Enfield"
ITEM.Description 		= "A bolt-action rifle designed by British Commonwealth designed in the late 1880s.\n\nChambered in .303 British."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_enfield.mdl")

ITEM.Width 				= 4
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 30000
ITEM.SellPrice          = 25000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_enfield",
		Model = "models/tnb/weapons/w_enfield.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Lee–Enfield.",
		Width = 4,
		Height = 1
	},
	Telescopic = {
		WeaponClass = "eternity_firearm_enfield_telescopic",
		Model = "models/tnb/weapons/w_enfield.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Telescopic",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a telescopic scope to the weapon's frame for long ranged accuracy.",
		Width = 4,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_303british"] = true
}

return ITEM