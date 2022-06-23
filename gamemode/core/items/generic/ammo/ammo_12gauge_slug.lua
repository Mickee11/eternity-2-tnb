ITEM = class.Create("base_ammo")

ITEM.Name 				= "12-Gauge Slug Ammunition"
ITEM.Description 		= "A box of 12-Gauge Slug shells."

ITEM.Model 				= Model("models/Items/BoxBuckshot.mdl")

ITEM.MaxStack 			= 200

ITEM.AmmoClass			= "12gauge_slug"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 5
ITEM.SellPrice          = 0

return ITEM