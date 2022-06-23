ITEM = class.Create("base_weapon")

ITEM.Name 				= "Metal Pipe"
ITEM.Description 		= "A rusted metallic pipe collected from some remnants of an apartment building or otherwise."
ITEM.OutlineColor		= Color(194, 136, 115)

ITEM.Model 				= "models/props_canal/mattpipe.mdl"

ITEM.Width 				= 1
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_MELEE}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 100
ITEM.SellPrice          = 75

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_melee_pipe",
		Model = "models/props_canal/mattpipe.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the pipe.",
		Width = 1,
		Height = 2
	},
}

ITEM.AmmoTypes 			= { }

return ITEM
