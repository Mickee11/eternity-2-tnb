ITEM = class.Create("base_clothing")

ITEM.Name 				= "CEC Worker's Uniform"
ITEM.Description 		= "A grey construction suit plastered with Combine logos."

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
		Name = "Toggle Helmet",
		Callback = function()
			self.UseHelmet = not self.UseHelmet

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
        local helm = self.UseHelmet

        if helm and tostring(helm) == "false" then
            helm = 0
        elseif helm and tostring(helm) == "true" then
            helm = 1
        else
            helm = 0
        end

        local data = { 
            _base = {
                Model = Model("models/tnb/halflife2/combine/worker/worker_player.mdl"),
                Skin = 0,
                Bodygroups = {
                    Uniform_Variant = 0,
                    Helmet = helm
                }
            }
        }

        if old.back then
            data.back = old.back
        end

        if helm == 1 then
            data.head = {
                Model = Model(ply:CharModel()),
                Skin = ply:CharSkin()
            }

            local hat = ply:GetEquipment(EQUIPMENT_HEAD)
			if hat then
				local hatd = hat:GetModelData(ply)

				if hatd.head then
					data.head = hatd.head
				else
					data.head.Bodygroups = {
						headgear = hatd._base.Bodygroups.headgear
					}
				end
			end
        end

        return data
    end
end

return ITEM
