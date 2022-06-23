ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Uniform"
ITEM.Description 		= "A blue, standard issue uniform for Civil Protection Ground Units."

ITEM.Model 				= Model("models/tnb/halflife2/world_torso_metropolice.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

if SERVER then
	function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_combine.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
	end
	
    function ITEM:GetModelData(ply)
        return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/cca/%s_torso_metropolice.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 0
			}
        }
	end

	function ITEM:PostModelData(ply, data)
		data.hands = nil

		return data
	end
end

return ITEM
