ITEM = class.Create("base_weapon")

ITEM.Name 				= "S&W 659"
ITEM.Description 		= "An American stainless steel pistol from the late 1900's.\n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_ins2/w_sw659.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 3

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sw659",
		Model = "models/weapons/tfa_ins2/w_sw659.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the S&W 659.",
		Width = 1,
		Height = 3
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}

return ITEM