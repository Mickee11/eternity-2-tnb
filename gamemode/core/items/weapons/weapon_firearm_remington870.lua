ITEM = class.Create("base_weapon")

ITEM.Name 				= "Remington 870"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/smc/r870/w_remington_m870.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 17500
ITEM.SellPrice          = 12500

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_remington870_S_18",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Remington 870.",
		Width = 6,
		Height = 1
	},
	LongBarrel20 = {
		WeaponClass = "eternity_firearm_remington870_S_20",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Extended",
		Cost = 0,
		Refund = 2,
		Description = "A modified version of the Remington 870.",
		Width = 7,
		Height = 1
	},
	ShortBarrel16 = {
		WeaponClass = "eternity_firearm_remington870_S_16",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2},
		Title = "Short Barrel",
		Cost = 0,
		Refund = 2,
		Description = "A modified version of the Remington 870.",
		Width = 4,
		Height = 1
	},
	DefaultNoStock = {
	WeaponClass = "eternity_firearm_remington870_NS_18",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {[2] = 1},
		Title = "No Stock",
		Cost = 0,
		Refund = 2,
		Description = "A modified version of the Remington 870.",
		Width = 5,
		Height = 1
	},
	LongBarrel20NoStock = {
		WeaponClass = "eternity_firearm_remington870_NS_20",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1,
			   		  [2] = 1},
		Title = "Extended No Stock",
		Cost = 0,
		Refund = 2,
		Description = "A modified version of the Remington 870.",
		Width = 5,
		Height = 1
	},
		ShortBarrel16NoStock = {
		WeaponClass = "eternity_firearm_remington870_NS_16",
		Model = "models/weapons/smc/r870/w_remington_m870.mdl",
		Skin = 0,
		Bodygroups = {[1] = 2,
			          [2] = 1},
		Title = "CQB",
		Cost = 0,
		Refund = 2,
		Description = "A modified version of the Remington 870.",
		Width = 3,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM