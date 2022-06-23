ITEM = class.Create("base_item")

ITEM.OutlineColor 		= Color(110, 230, 50)

ITEM.EquipmentSlots 	= {EQUIPMENT_VORTIGAUNT}

ITEM.ItemGroup 			= "Clothing"

ITEM.Species 			= {SPECIES_VORTIGAUNT}

function ITEM:CanEquip(ply)
	return table.HasValue(self.Species, ply:Species())
end

return ITEM 