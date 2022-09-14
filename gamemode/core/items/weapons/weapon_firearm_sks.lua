ITEM = class.Create("base_weapon")

ITEM.Name 				= "SKS"
ITEM.Description 		= "Chinese knockoff of a Soviet rifle. Designed in the 1900's. \n\nChambered in 7.62x39mm."
ITEM.OutlineColor		= Color(125, 159, 115)

ITEM.Model 				= Model("models/weapons/sks_ins/w_sks.mdl")

ITEM.Width 				= 6
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_PRIMARY}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 8000
ITEM.SellPrice          = 6000

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_firearm_sks",
		Model = "models/weapons/sks_ins/w_sks.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 2,
		Description = "The base model of the SKS.",
		Width = 6,
		Height = 1
	},
	
}

ITEM.AmmoTypes 			= {
	["ammo_762x39mm"] = true

}

return ITEM