ITEM = class.Create("base_clothing")

ITEM.Name 				= "Beret"
ITEM.Description 		= "A fancy Green Beret."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat6.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 120
ITEM.SellPrice 			= 50

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 6
				}
			}
		}
	end
end

return ITEM