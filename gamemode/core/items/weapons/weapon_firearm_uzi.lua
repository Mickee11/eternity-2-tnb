ITEM = class.Create("base_weapon")

ITEM.Name 				= "Uzi"
ITEM.Description 		= "An Israeli open-bolt, blowback-operated submachine gun designed in the 1940s.\n\nChambered in 9x19mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_uzi.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 4000
ITEM.SellPrice          = 3000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_uzi",
		Model = "models/tnb/weapons/w_uzi.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Uzi.",
		Width = 2,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_uzi_sd",
		Model = "models/tnb/weapons/w_uzi.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "SD",
		Cost = 3,
		Refund = 3,
		Description = "Attaches a suppressor to the weapon's frame. Good for covert action.",
		Width = 3,
		Height = 1
	},
	Wood = {
		WeaponClass = "eternity_firearm_uzi_wood",
		Model = "models/tnb/weapons/w_uzi.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Wood Stock",
		Cost = 4,
		Refund = 4,
		Description = "Appends a wooden stock to the Uzi. Good if you're addicted to wooden stocks.",
		Width = 2,
		Height = 1
	},
	Short = {
		WeaponClass = "eternity_firearm_uzi_short",
		Model = "models/tnb/weapons/w_uzi.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "Short",
		Cost = 3,
		Refund = 3,
		Description = "Cuts the weapon's size down drastically. Good for concealment.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true
}

return ITEM