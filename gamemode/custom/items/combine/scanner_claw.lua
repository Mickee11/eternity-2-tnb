ITEM = class.Create("base_combine")

ITEM.Name 				= "AIRWATCH: Synthetic Scanner"
ITEM.Description 		= "A slightly unnerving version of the Combine's singature area scanner."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Species 			= {SPECIES_CMB_SCANNER}

ITEM.OutlineColor       = Color(219, 112, 147)

ITEM.ArmorLevel			= ARMOR_LIGHT

ITEM.Width 				= 2
ITEM.Height 			= 2
 
if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/shield_scanner.mdl")
			}
		}
	end
end
 
return ITEM