ITEM = class.Create("base_weapon")

ITEM.Name 				= "M2 Incinerator Unit"
ITEM.Description 		= "An outdated, but functional flame weapon. Requires a gas cannister to operate."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Color              = Color(127, 111, 63)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_projectile_flamethrower",
		Model = "models/Items/item_item_crate.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 5,
		Description = "The base model of the M2 Incinerator Unit.",
		Width = 2,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_flamethrower"] = true
}

return ITEM