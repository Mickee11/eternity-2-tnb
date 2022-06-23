ITEM = class.Create("base_clothing")

ITEM.Name 				= "Radio Headset"
ITEM.Description 		= "A handy, portable microphone. Could be plugged into a reciever."

ITEM.Model 				= Model("models/tnb/trpitems/headset.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice          = 100
ITEM.SellPrice          = 25

ITEM.ItemGroup 			= "Clothing"

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				Bodygroups = {
					headgear = 2
				}
			}
		}
	end
end

return ITEM
