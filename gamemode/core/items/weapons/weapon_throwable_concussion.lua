ITEM = class.Create("base_throwable")

ITEM.Name 				= "MK3 Concussion Hand Grenade"
ITEM.Description 		= "A cylindrical concussion grenade designed to produce casualties during close combat. Features a three-second timer."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_grenade.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1000

ITEM.WeaponClass 		= "eternity_throwable_concussion"

return ITEM