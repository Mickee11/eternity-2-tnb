ITEM = class.Create("base_weapon")

ITEM.Name 				= "Double Barrel"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_doublebarrel_new.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 15000
ITEM.SellPrice          = 10000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_doublebarrel",
		Model = "models/weapons/w_doublebarrel_new.mdl",
		Skin = {0},
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "Placeholder.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM