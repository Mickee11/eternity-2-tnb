ITEM = class.Create("base_clothing")

ITEM.Name 				= "Tactical Gasmask"
ITEM.Description 		= "How does this thing still hold a seal after all these years?"

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask7.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 750
ITEM.SellPrice 			= 200

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 7
				}
			}
		}
	end
end

return ITEM