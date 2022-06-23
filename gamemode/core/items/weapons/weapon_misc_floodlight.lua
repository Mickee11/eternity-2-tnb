ITEM = class.Create("base_weapon")

ITEM.Name 				= "Handheld Floodlight"
ITEM.Description 		= "A portable floodlight meant for creating wide beams of light. Runs on a large rechargable battery."

ITEM.Model 				= Model("models/lamps/torch.mdl")
ITEM.Color 				= Color(220, 220, 40)
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Width 				= 1
ITEM.Height 			= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 250
ITEM.SellPrice          = 200

ITEM.Variants			= {
	Default = {
		WeaponClass = "eternity_misc_flood",
		Model = "models/lamps/torch.mdl",
		Skin = 0,
		Bodygroups = {[1] = 0},
		Title = "Default",
		Cost = 0,
		Refund = 1,
		Description = "The base model of the floodlight.",
		Width = 1,
		Height = 1
	},
}

ITEM.AmmoTypes 			= { }

return ITEM