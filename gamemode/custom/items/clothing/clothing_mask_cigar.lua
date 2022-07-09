ITEM = class.Create("base_clothing")

ITEM.Name 				= "Cigar"
ITEM.Description 		= "The classic stogie."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask3.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 250
ITEM.SellPrice 			= 50

ITEM.Filtered 			= false

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 3
				}
			}
		}
	end
end

return ITEM
