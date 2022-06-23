ITEM = class.Create("base_weapon")

ITEM.Name 				= "Winchester Model 24"
ITEM.Description 		= "A classic American double-barreled shotgun.\n\nFires a 12-Gauge shell."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/tnb/weapons/w_sawnoff.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 15000
ITEM.SellPrice          = 1000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_winchester24",
		Model = "models/tnb/weapons/w_sawnoff.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Winchester 24.",
		Width = 3,
		Height = 1
	},
	Sawn = {
		WeaponClass = "eternity_firearm_winchester24_sawnoff",
		Model = "models/tnb/weapons/w_sawnoff.mdl",
		Skin = 0,
		Bodygroups = {[1] = 1},
		Title = "Sawn Off",
		Cost = 3,
		Refund = 3,
		Description = "Saws off the barrel of the Winchester 24.",
		Width = 2,
		Height = 1
	},
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM