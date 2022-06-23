ITEM = class.Create("base_vortigaunt")

ITEM.Name 				= "Biotic Servitor Restrictors"
ITEM.Description 		= "A horrific device used to prevent Vortigaunts from using their powers"

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

function ITEM:Break()
    self.Broken = 1
end

function ITEM:DisableEquipNotification()
    self.NoNotification = 1
end

function ITEM:OnEquip(ply, slot, loading)
    if not self.Broken and not self.NoNotification then
        self.NoNotification = 1

        ply:SetSpeciesState("slave")

        ply:SendChat("NOTICE", "The restrictors click and lock into place, you're not getting out anytime soon")
    end

    self:ParentCall("OnEquip", ply, slot, loading)
end

function ITEM:GetDescription()
    local description = self.Description

    if self.Broken and self.Broken == 1 then
        description = description .. "?"
    else
        description = description .. "."
    end

	return description
end

function ITEM:CanUnequip(ply)
    if self.Broken ~= nil and self.Broken == 1 then
        return true
    end

    return false
end

if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/vortigaunt_slave.mdl"),
				Skin = 0
			}
		}
	end
end
 
return ITEM 