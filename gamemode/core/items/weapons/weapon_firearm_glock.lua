ITEM = class.Create("base_weapon")

ITEM.Name 				= "Glock 17"
ITEM.Description 		= "An Austrian-designed, polymer framed pistol designed in the 1980s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_glock.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1000
ITEM.SellPrice          = 850

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_glock",
		Model = "models/tnb/weapons/w_glock.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the Glock 17.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_glock_sd",
		Model = "models/tnb/weapons/w_glock.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a suppressor and undermounted laser sight to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM