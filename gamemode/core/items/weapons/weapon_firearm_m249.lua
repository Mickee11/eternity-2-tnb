ITEM = class.Create("base_weapon")

ITEM.Name 				= "M249 Light Machine Gun"
ITEM.Description 		= "An American gas operated and air-cooled squad automatic weapon.\n\nChambered in 5.56x45mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_m249.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 50000
ITEM.SellPrice          = 40000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_m249",
		Model = "models/tnb/weapons/w_m249.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the M249 LMG.",
		Width = 3,
		Height = 2
	},
	HS = {
		WeaponClass = "eternity_firearm_m249_holo",
		Model = "models/tnb/weapons/w_m249.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Holo",
		Cost = 2,
		Refund = 2,
		Description = "Attaches a holographic sight and foregrip to the weapon's frame. Increases stability.",
		Width = 3,
		Height = 2
	},
	Acog = {
		WeaponClass = "eternity_firearm_m249_acog",
		Model = "models/tnb/weapons/w_m249.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Acog",
		Cost = 2,
		Refund = 2,
		Description = "Attaches an Acog scope to the weapon's frame. Helps with distance.",
		Width = 3,
		Height = 2
	},
	Aim = {
		WeaponClass = "eternity_firearm_m249_aim",
		Model = "models/tnb/weapons/w_m249.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "Aimpoint",
		Cost = 2,
		Refund = 2,
		Description = "Attaches an aimpoint sight and foregrip to the weapon's frame. Increases stability.",
		Width = 3,
		Height = 2
	},
}

ITEM.AmmoTypes 			= {
	["ammo_556x45mm"] = true
}

return ITEM