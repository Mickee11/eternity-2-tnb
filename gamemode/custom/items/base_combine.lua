ITEM = class.Create("base_item")

ITEM.OutlineColor 		= Color(220, 160, 20)

ITEM.EquipmentSlots 	= {EQUIPMENT_COMBINE}

ITEM.ItemGroup 			= "Clothing"

ITEM.Species 			= {SPECIES_CMB_SOLDIER, SPECIES_CMB_TYRANT}

ITEM.CustomDescribe		= false

function ITEM:CanEquip(ply)
	return table.HasValue(self.Species, ply:Species())
end

function ITEM:VisibleRPName(ply, scoreboard)
    return ply:RPName()
end

return ITEM 