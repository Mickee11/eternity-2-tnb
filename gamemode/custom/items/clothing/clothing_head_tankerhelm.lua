ITEM = class.Create("base_clothing")

ITEM.Name 				= "Tanker Helmet"
ITEM.Description 		= "Tanker helmet, offers no cranial protection. Pretty warm though."

ITEM.Model 				= Model("models/tnb/items/trp/headgear/hat7.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 50
ITEM.SellPrice 			= 10

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 7
				}
			}
		}
	end
end

return ITEM