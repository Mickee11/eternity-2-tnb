ITEM = class.Create("base_vortigaunt")

ITEM.Name 				= "Vortigaunt's Lab Coat"
ITEM.Description 		= "Stretched at the seams, this coat's been modified to fit Vortigaunts."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/vortigaunt_doctor.mdl"),
				Skin = 0
			}
		}
	end
end
 
return ITEM 