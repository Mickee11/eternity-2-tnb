ITEM = class.Create("base_clothing")

ITEM.Name 				= "Glasses"
ITEM.Description 		= "Used to help your eyesight."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/eyewear5.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_EYES}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 20
ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					eyewear = 5
				}
			}
		}
	end
end

return ITEM