ITEM = class.Create("base_weapon")

ITEM.Name 				= "FN FNP45"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_ins2_pist_fnp45.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

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
		Description = "The base model of the FN FNP45.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}

return ITEM