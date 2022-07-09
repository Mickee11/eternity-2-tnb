ITEM = class.Create("base_clothing")

ITEM.Name 				= "Red Bandana"
ITEM.Description 		= "Red bandana."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat8.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 8
				}
			}
		}
	end
end

return ITEM