ITEM = class.Create("base_clothing")

ITEM.Name 				= "Infestation Control Hazmat Suit"
ITEM.Description 		= "A bright, high visibility suit meant to protect you from your toxic friends."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.OutlineColor       = Color(134, 197, 218)

ITEM.ArmorOverride      = true
ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

ITEM.Filtered 			= true

function ITEM:GetOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle Airtank",
		Callback = function()
			self.UseTank = not self.UseTank

			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetOptions", ply))
end

if SERVER then
    function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_hev.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
    end
    
    function ITEM:PostModelData(ply, old)
        local tank = self.UseTank

        if tank and tostring(tank) == "false" then
            tank = 0
        elseif tank and tostring(tank) == "true" then
            tank = 1
        else
            tank = 0
        end

        return { 
            _base = {
                Model = Model("models/tnb/halflife2/combine/workers/hazmat_worker_player.mdl"),
                Skin = 1,
                Bodygroups = {
                    Tank = tank,
                    Misc = tank
                }
            }
        }
    end
end

return ITEM
