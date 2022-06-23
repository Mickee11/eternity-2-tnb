ITEM = class.Create("base_stacking")

ITEM.SingularName 		= "%s Weapon Part"
ITEM.PluralName 		= "%s Weapon Parts"

ITEM.Description 		= "An assortment of tools and parts meant to assist in the modification of most firearms and other weapons."

ITEM.Model 				= Model("models/props_junk/cardboard_box004a.mdl")

ITEM.ItemGroup 			= "Currency"
ITEM.ItemTags           ={ "Crafting" }

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1000
ITEM.SellPrice          = 500

ITEM.MaxStack 			= 5

return ITEM