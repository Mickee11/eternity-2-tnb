ITEM = class.Create("base_item")

ITEM.Name 				= "Gas Cannister"
ITEM.Description 		= "A highly pressurized gas cannister."

ITEM.Model 				= Model("models/props_junk/propanecanister001a.mdl")
ITEM.Color              = Color(70, 70, 70)

ITEM.MaxStack 			= 1

ITEM.AmmoClass 			= "vfire"

return ITEM
