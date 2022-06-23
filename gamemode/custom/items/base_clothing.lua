ITEM = class.Create("base_item")

ITEM.Model 			= Model("models/dav0r/hoverball.mdl")

ITEM.ItemGroup		= "Appearance"

ITEM.HandsModel		= nil

function ITEM:SetupHands(ply, ent)
	return false
end

function ITEM:CanEquip(ply)
	return true
end

function ITEM:CanUnequip(ply)
	return true
end

function ITEM:GetOptions(ply)
	local tab =  self:GetContextOptions(ply)

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end


return ITEM