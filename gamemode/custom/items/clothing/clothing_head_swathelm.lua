ITEM = class.Create("base_clothing")

ITEM.Name 				= "SWAT Helmet"
ITEM.Description 		= "Old World SWAT helmet."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat16.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 900
ITEM.SellPrice 			= 250

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 16
				}
			}
		}
	end
end

return ITEM