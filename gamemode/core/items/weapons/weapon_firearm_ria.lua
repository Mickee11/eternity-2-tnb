ITEM = class.Create("base_weapon")

ITEM.Name 				= "RIA 1911"
ITEM.Description 		= "An Philippines-remodel of the original M1911 from the early 1910s.\n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_1911.mdl")
ITEM.Skin               = 1

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1000
ITEM.SellPrice          = 850

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_ria",
		Model = "models/tnb/weapons/w_1911.mdl",
		Skin = 1,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the RIA 1911.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_ria_sd",
		Model = "models/tnb/weapons/w_1911.mdl",
		Skin = 1,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a suppressor to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}


return ITEM