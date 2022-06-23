ITEM = class.Create("base_clothing")

ITEM.Name 				= "Facewrap"
ITEM.Description 		= "It's just a piece of cloth really."

ITEM.Model 				= Model("models/tnb/items/facewrap.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 30
ITEM.SellPrice 			= 15

ITEM.Filtered 			= false

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					headgear = 6
				}
			}
		}
	end
end

return ITEM
