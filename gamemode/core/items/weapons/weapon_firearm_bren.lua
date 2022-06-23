ITEM = class.Create("base_weapon")

ITEM.Name 				= "Bren Light Machine Gun"
ITEM.Description 		= "A Czechoslovaki-designed squad automatic weapon from the early 1930s.\n\nChambered in .303 British."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_bren.mdl")
ITEM.Skin               = 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 35000
ITEM.SellPrice          = 30000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_bren",
		Model = "models/tnb/weapons/w_bren.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Bren LMG.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_303british"] = true
}


return ITEM