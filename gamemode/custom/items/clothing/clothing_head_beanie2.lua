ITEM = class.Create("base_clothing")

ITEM.Name				= "Beanie" -- Ingame name
ITEM.Description		= "Generic black beanie. Nothing special." -- Ingame description

ITEM.Model				= Model("models/tnb/items/trp/headgear/hat4.mdl") -- Model of item

ITEM.EquipmentSlots		= {EQUIPMENT_HEAD} -- What slot the item goes into

ITEM.License			= LICENSE_CLOTHING
ITEM.UnitPrice			= 40
ITEM.SellPrice			= 15

ITEM.ItemGroup			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					hat = 4
				}
			}
		}
	end
end

return ITEM