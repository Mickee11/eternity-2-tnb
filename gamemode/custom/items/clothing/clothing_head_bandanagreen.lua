ITEM = class.Create("base_clothing")

ITEM.Name 				= "Green Bandana"
ITEM.Description 		= "Green Bandana."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat9.mdl")

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
					hat = 9
				}
			}
		}
	end
end

return ITEM