ITEM = class.Create("base_ammo")

ITEM.Name 				= ".45 ACP Ammunition"
ITEM.Description 		= "A box of .45 ACP rounds."

ITEM.Model 				= Model("models/Items/BoxSRounds.mdl")

ITEM.MaxStack 			= 500

ITEM.AmmoClass 			= "45acp"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1
ITEM.SellPrice          = 0

return ITEM