ITEM = class.Create("base_combine")

ITEM.Name 				= "TYRANT: Elite Form"
ITEM.Description 		= "A larger, white variant of the Combine's signature shock trooper."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Species 			= {SPECIES_CMB_TYRANT}

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Width 				= 2
ITEM.Height 			= 2
 
if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/tnb/halflife2/combine/synth_soldier.mdl"),
                Skin = 1,
                Scale = 1.5
			}
		}
	end
end
 
return ITEM