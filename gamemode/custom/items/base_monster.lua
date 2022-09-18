ITEM = class.Create("base_item")

ITEM.OutlineColor 		= Color(200, 230, 60)

ITEM.EquipmentSlots 	= {EQUIPMENT_MONSTER}

ITEM.ItemGroup 			= "Clothing"

ITEM.Species 			= {SPECIES_MONSTER}

ITEM.CustomDescribe		= false

ITEM.Width 				= 1
ITEM.Height 			= 1

function ITEM:OnEquip(ply, slot, loading)
	if self.GetSpeeds then
		ply:HandleMoveSpeed()
	end

	if self.Loadout then
		ply:HandleLoadout()
	end

	self:ParentCall("OnEquip", ply, slot, loading)
end

function ITEM:OnUnequip(ply, slot, unloading)
	if not unloading then
		if self.GetSpeeds then
			ply:HandleMoveSpeed()
		end

		if self.Loadout then
			ply:HandleLoadout()
		end
	end

	self:ParentCall("OnUnequip", ply, slot, unloading)
end

function ITEM:CanEquip(ply)
	return table.HasValue(self.Species, ply:Species())
end

function ITEM:CanUnequip(ply)
	return true
end

function ITEM:PostModelData(ply, data)
	return data
end

function ITEM:OverwriteFootsteps(ply, step, walking)
	return nil
end

function ITEM:CanDrop(ply)
	if ply:IsAdmin() then
		return true
	end

	return false
end

return ITEM
