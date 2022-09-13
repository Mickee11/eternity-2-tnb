ITEM = class.Create("base_weapon")

ITEM.Name 				= "Manurhin MR96"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_revolver_mr96.mdl")
ITEM.Skin               = 0

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mr96",
		Model = "models/weapons/w_ins2_revolver_mr96.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Manurhin MR96.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_357magnum"] = true
}


return ITEM