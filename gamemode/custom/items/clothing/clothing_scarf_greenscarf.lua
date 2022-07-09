ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Scarf"
ITEM.Description 		= "Green Fabric to wrap around your neck."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/scarf2.mdl")

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
					scarf = 2
				}
			}
		}
	end
end

return ITEM