ITEM = class.Create("base_weapon")

ITEM.Name 				= "Heckler & Koch USP Compact"
ITEM.Description 		= "A German-developed semi-automatic pistol from the late 1980s.\n\nChambered in .45 ACP."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_usp.mdl")

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_SECONDARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1250

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_usp",
		Model = "models/tnb/weapons/w_usp.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the USP.",
		Width = 1,
		Height = 1
	},
	Laser = {
		WeaponClass = "eternity_firearm_usp_laser",
		Model = "models/tnb/weapons/w_usp.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Laser",
		Cost = 1,
		Refund = 1,
		Description = "Attaches a laser to the weapon's frame.",
		Width = 1,
		Height = 1
	},
	SD = {
		WeaponClass = "eternity_firearm_usp_sd",
		Model = "models/tnb/weapons/w_usp.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "SD",
		Cost = 4,
		Refund = 4,
		Description = "Attaches a suppressor and laser to the weapon's frame. Good for covert action.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_45acp"] = true
}

return ITEM