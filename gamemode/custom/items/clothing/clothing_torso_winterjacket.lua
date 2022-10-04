ITEM = class.Create("base_clothing")

ITEM.Name 				= "Winter Coat"
ITEM.Description 		= "Built for snow, incredibly comfortable."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1
ITEM.Color 				= Color(109, 109, 109)

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 70

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
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
				Model = Model(string.format("models/tnb/halflife2/cca/%s_torso_metropolice_winter.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
	function ITEM:PostModelData(ply, data)
		data.hands = nil

		return data
	end
end

return ITEM
