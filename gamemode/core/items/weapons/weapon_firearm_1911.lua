ITEM = class.Create("base_weapon")

ITEM.Name 				= "M1911"
ITEM.Description 		= "American made. Survived Two World Wars.\n\nChambered in 45 ACP."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/m1911/w_m1911.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1950
ITEM.SellPrice          = 1350

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_1911",
		Model = "models/weapons/m1911/w_m1911.mdl",
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