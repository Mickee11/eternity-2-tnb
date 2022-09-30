ITEM = class.Create("base_weapon")

ITEM.Name 				= "FNP .45"
ITEM.Description 		= "Modern semi-automatic sidearm originating from the United States.\n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_pist_fnp45.mdl")
ITEM.Skin               = 0

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1000
ITEM.SellPrice          = 850

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_fnp45",
		Model = "models/weapons/w_ins2_pist_fnp45.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the FNP.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}


return ITEM