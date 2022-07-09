ITEM = class.Create("base_clothing")

ITEM.Name 				= "Shades"
ITEM.Description 		= "A pair of snazzy looking sunglasses."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear1.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 60
ITEM.SellPrice 			= 20

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 1
				}
			}
		}
	end
end

return ITEM