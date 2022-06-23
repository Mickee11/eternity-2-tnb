ITEM = class.Create("base_ammo")

ITEM.Name 				= "7.62×51mm Ammunition"
ITEM.Description 		= "A box of 7.62×51mm rounds."

ITEM.Model 				= Model("models/Items/BoxMRounds.mdl")

ITEM.MaxStack 			= 500

ITEM.AmmoClass			= "762x51mm"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2
ITEM.SellPrice          = 0

return ITEM