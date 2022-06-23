ITEM = class.Create("base_weapon")

ITEM.Name 				= "SCAR-H"
ITEM.Description 		= "A Belgian assault rifle developed and produced during the aftermath of the Resonance Cascade.\n\nChambered in 7.62x51mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_scar.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_scarh",
		Model = "models/tnb/weapons/w_scar.mdl",
		Skin = 0,
		Bodygroups = {[1] = 3},
		Title = "Default",
		Cost = 0,
		Refund = 3,
		Description = "The base model of the SCAR-H.",
		Width = 3,
		Height = 2
	},
	CQC = {
		WeaponClass = "eternity_firearm_scarh_cqc",
		Model = "models/tnb/weapons/w_scar.mdl",
		Skin = 0,
		Bodygroups = {[1] = 5},
		Title = "CQC",
		Cost = 2,
		Refund = 2,
		Description = "A basic variant which comes with an optic and muzzle device.",
		Width = 3,
		Height = 2
	},
	DMR = {
		WeaponClass = "eternity_firearm_scarh_dmr",
		Model = "models/tnb/weapons/w_scar.mdl",
		Skin = 0,
		Bodygroups = {[1] = 4},
		Title = "DMR",
		Cost = 4,
		Refund = 4,
		Description = "A longer barreled version equipped with a 1.5-3x magnified optic.",
		Width = 3,
		Height = 2
	},
	Mk20 = {
		WeaponClass = "eternity_firearm_scarh_mk20",
		Model = "models/tnb/weapons/w_scar.mdl",
		Skin = 0,
		Bodygroups = {[1] = 7},
		Title = "Mk 20 SSR",
		Cost = 8,
		Refund = 8,
		Description = "A heavily modified version featuring a suppressor, bipod, extended heavy barrel and a 3-6x scope.",
		Width = 3,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_762x51mm"] = true
}

return ITEM
