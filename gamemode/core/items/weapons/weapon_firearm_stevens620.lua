ITEM = class.Create("base_weapon")

ITEM.Name 				= "Stevens 620"
ITEM.Description 		= "Placeholder."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/w_nam_stevens620.mdl")

ITEM.Width 				= 3
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 8000
ITEM.SellPrice          = 6000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_stevens620",
		Model = "models/weapons/w_nam_stevens620.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the Ithaca Model 37.",
		Width = 3,
		Height = 1
	},
	
}

ITEM.AmmoTypes 			= {
	["ammo_12gauge_buckshot"] = true,
	["ammo_12gauge_slug"] = true

}

return ITEM