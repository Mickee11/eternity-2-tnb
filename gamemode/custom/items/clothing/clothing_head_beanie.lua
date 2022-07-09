ITEM = class.Create("base_clothing")

ITEM.Name 				= "Beanie"
ITEM.Description 		= "A generic beanie, nothing to it really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat5.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 40
ITEM.SellPrice 			= 15

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 5
				}
			}
		}
	end
end

return ITEM
