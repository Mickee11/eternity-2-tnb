ITEM = class.Create("base_weapon")

ITEM.Name 				= "Test"
ITEM.Description 		= "Test."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/gs3/test/w_pistoldual.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1950
ITEM.SellPrice          = 1350

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_test",
		Model = "models/gs3/test/w_pistoldual.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the M1911.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}

return ITEM