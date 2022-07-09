ITEM = class.Create("base_clothing")

ITEM.Name 				= "Aviators"
ITEM.Description 		= "The classic."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear3.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 100
ITEM.SellPrice 			= 45

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 3
				}
			}
		}
	end
end

return ITEM