ITEM = class.Create("base_throwable")

ITEM.Name 				= "Riot Control CS Grenade"
ITEM.Description 		= "Designed specifically for outdoor use in crowd control situations with a high volume continuous burn that expels its payload in approximately forty to sixty seconds."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/weapons/w_grenade.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1000

ITEM.WeaponClass 		= "eternity_throwable_csgas"
ITEM.SmokeColor 		= Vector(205, 205, 140)

return ITEM