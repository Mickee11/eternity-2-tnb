ITEM = class.Create("base_weapon")

ITEM.Name 				= "Colt Cobra"
ITEM.Description 		= "An American revolver from the late 1980s.\n\nChambered in .357 Magnum."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_thanez_cobra.mdl")
ITEM.Skin               = 0
ITEM.Bodygroups         = {[1] = 1}

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 25000
ITEM.SellPrice          = 20000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_cobra",
		Model = "models/tnb/weapons/w_magnum.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Colt Cobra.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_357magnum"] = true
}


return ITEM