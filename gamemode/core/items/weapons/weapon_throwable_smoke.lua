ITEM = class.Create("base_throwable")

ITEM.Name 				= "AN-M8 HC Smoke Grenade"
ITEM.Description 		= "A military grenade used as a ground-to-ground obscuring or screening device. Burns anywhere between fifty and ninety seconds."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_grenade.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.WeaponClass 		= "eternity_throwable_smoke"
ITEM.SmokeColor 		= Vector(135, 135, 135)

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1000
ITEM.SellPrice          = 750

return ITEM