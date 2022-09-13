ITEM = class.Create("base_weapon")

ITEM.Name 				= "Makarov"
ITEM.Description 		= "Soviet produced semi-automatic pistol designed in the late 1940s.\n\nChambered in 9x18mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/tfa_at_pm_ins_s/w_makarov.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2800
ITEM.SellPrice          = 2100

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_makarov",
		Model = "models/weapons/tfa_at_pm_ins_s/w_makarov.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Makarov.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x18mm"] = true
}

return ITEM