ITEM = class.Create("base_ammo")

ITEM.Name 				= "5.56×45mm Ammunition"
ITEM.Description 		= "A box of 5.56×45mm rounds."

ITEM.Model 				= Model("models/Items/BoxMRounds.mdl")

ITEM.MaxStack 			= 500

ITEM.AmmoClass 			= "556x45mm"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 2
ITEM.SellPrice          = 0

return ITEM