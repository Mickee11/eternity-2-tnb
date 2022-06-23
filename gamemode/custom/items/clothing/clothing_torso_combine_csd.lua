ITEM = class.Create("base_clothing")

ITEM.Name 				= "Conduct & Standards Dress Uniform"
ITEM.Description 		= "A green dress uniform worn by officials of the ASI's Conduct and Standards Division."

ITEM.Model 				= Model("models/tnb/halflife2/world_torso_metropolice.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

if SERVER then
    function ITEM:GetModelData(ply)
        return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_officer.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = 1
			}
        }
	end
end

return ITEM
