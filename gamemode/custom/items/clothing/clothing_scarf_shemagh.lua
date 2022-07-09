ITEM = class.Create("base_clothing")

ITEM.Name 				= "Shemagh"
ITEM.Description 		= "A shemagh."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/scarf3.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_SCARF}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					scarf = 3
				}
			}
		}
	end
end

return ITEM