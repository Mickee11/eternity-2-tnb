ITEM = class.Create("base_clothing")

ITEM.Name 				= "Baseball Cap"
ITEM.Description 		= "A generic hat, nothing to it really."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat3.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 70
ITEM.SellPrice 			= 30

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 3
				}
			}
		}
	end
end

return ITEM
