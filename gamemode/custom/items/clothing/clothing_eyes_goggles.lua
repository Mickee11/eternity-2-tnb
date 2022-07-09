ITEM = class.Create("base_clothing")

ITEM.Name 				= "Ski Goggles"
ITEM.Description 		= "An old pair of ski goggles."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear2.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 80
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 2
				}
			}
		}
	end
end

return ITEM