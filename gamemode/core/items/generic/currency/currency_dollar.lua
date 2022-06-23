ITEM = class.Create("base_stacking")

ITEM.SingularName 		= "%s U.S. Dollar"
ITEM.PluralName 		= "%s U.S. Dollars"

ITEM.Description 		= "The standard currency of the United States."

ITEM.Model 				= Model("models/props/cs_assault/Money.mdl")

ITEM.ItemGroup 			= "Currency"

ITEM.MaxStack 			= 5000

return ITEM 