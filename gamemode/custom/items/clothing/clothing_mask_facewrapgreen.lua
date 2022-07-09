ITEM = class.Create("base_clothing")

ITEM.Name 				= "Facewrap"
ITEM.Description 		= "It's just a piece of cloth really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/mask2.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MASK}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 30
ITEM.SellPrice 			= 15

ITEM.Filtered 			= false

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					mask = 2
				}
			}
		}
	end
end

return ITEM