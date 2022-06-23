ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Field Command Faceplate"
ITEM.Description 		= "A specially reinforced facemask, vocoder included, issued to Civil Protection Field Commanders."

ITEM.Model 				= Model("models/tnb/halflife2/world_head_metropolice.mdl")
ITEM.Material           = "models/tnb/cca/metropolice_head_fc"

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"

ITEM.Filtered 			= true

function ITEM:OnUnequip(ply, slot, unloading)
	ply:SetVISR(false)

	self:ParentCall("OnUnequip", ply, slot, unloading)
end

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle NVG Mode",
		Callback = function()
			ply:SetVISR(not ply:VISR())
		end
	})

	table.insert(tab, {
		Name = "Toggle Faceplate",
        Callback = function()
            self.ShowFace = not self.ShowFace
            
            ply:HandlePlayerModel()
		end
	})

	return tab
end

if SERVER then
    function ITEM:GetModelData(ply)
        local body = ply:GetEquipment(EQUIPMENT_TORSO)
        local fc = {
            ["clothing_torso_metropolice_fc"] = true,
            ["clothing_torso_metropolice_fc_stripped"] = true,
            ["clothing_torso_metropolice_adj"] = true,
            ["clothing_torso_metropolice_adj_stripped"] = true,
        }

        local skin = 3

        -- change skin to match fc gear
        if body and fc[body:GetClassName()] then
            skin = 2
        end

        local model = string.format("models/tnb/halflife2/cca/%s_head_metropolice.mdl", GAMEMODE:GetGenderString(ply:CharModel()))

        if self.ShowFace then
            model = string.format("models/tnb/halflife2/%s_head_metrocop_open.mdl", GAMEMODE:GetGenderString(ply:CharModel()))
        end

		return {
			_base = {
				HideHead = not self.ShowFace
			},
			head = {
                Model = Model(model),
                Skin = skin
			}
		}
	end
end

return ITEM
