ITEM = class.Create("base_ammo")

ITEM.Name 				= ".357 Magnum Ammunition"
ITEM.Description 		= "A box of .357 Magnum rounds."

ITEM.Model 				= Model("models/Items/357ammo.mdl")

ITEM.MaxStack 			= 100

ITEM.AmmoClass 			= "357magnum"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2
ITEM.SellPrice          = 0

return ITEM