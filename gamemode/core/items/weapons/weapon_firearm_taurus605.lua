ITEM = class.Create("base_weapon")

ITEM.Name 				= "Taurus Model 605"
ITEM.Description 		= "An Brazilian snub-nosed, single-action revolver from the 1990s.\n\nChambered in .357 Magnum."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_38.mdl")
ITEM.Skin               = 0

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 3000
ITEM.SellPrice          = 2000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_taurus605",
		Model = "models/tnb/weapons/w_38.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Model 605.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_357magnum"] = true
}

return ITEM