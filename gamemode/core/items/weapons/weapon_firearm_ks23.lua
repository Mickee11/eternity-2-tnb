ITEM = class.Create("base_weapon")

ITEM.Name				= "KS23"
ITEM.Description		= "Soviet Boomstick."
ITEM.OutlineColor				= Color(125, 159, 115)

ITEM.Model				= Model("models/tnb/weapons/w_ks23.mdl")

ITEM.Width				= 2
ITEM.Height				= 1

ITEM.EquipmentSlots		= {EQUIPMENT_PRIMARY}

ITEM.License			= LICENSE_BLACKMARKET
ITEM.UnitPrice			= 5000
ITEM.SellPrice			= 3000

ITEM.Variants			= {
 	Default = {
 		WeaponClass = "eternity_firearm_ks23",
 		Model = "models/tnb/weapons/w_ks23.mdl",
 		Skin = 0,
 		Bodygroups = {},
 		Title = "Default",
 		Cost = 0,
 		Refund = 2,
 		Description = "The base model of the Ks23",
 		Width = 3,
 		Height = 1
 	},
}

ITEM.AmmoTypes			= {
 	["ammo_12gauge_buckshot"] = true,
 	["ammo_12gauge_slug"] = true

}

 return ITEM