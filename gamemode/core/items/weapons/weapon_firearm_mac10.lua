ITEM = class.Create("base_weapon")

ITEM.Name 				= "Ingram MAC-10"
ITEM.Description 		= "An American compact submachine gun designed in the 1970s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_mac10.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 4000
ITEM.SellPrice          = 3000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_mac10",
		Model = "models/tnb/weapons/w_mac10.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the MAC-10.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_mac10_sd",
		Model = "models/tnb/weapons/w_mac10.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a suppressor to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
	Comp = {
		WeaponClass = "eternity_firearm_mac10_compensator",
		Model = "models/tnb/weapons/w_mac10.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Compensator",
		Cost = 1,
		Refund = 1,
		Description = "Attaches a compensator to the weapon's frame. Good for improved handling.",
		Width = 2,
		Height = 1
	},
}
ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM