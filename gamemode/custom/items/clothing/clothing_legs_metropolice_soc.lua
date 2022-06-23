ITEM = class.Create("base_clothing")

ITEM.Name 				= "Civil Protection Sociocontrol Commissioner Slacks"
ITEM.Description 		= "A black, standard issue uniform for Civil Protection Commissioners."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_metropolice.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 1}
}

if SERVER then
    function ITEM:GetModelData(ply)
        local gender = GAMEMODE:GetGenderString(ply:CharModel())

		return {
            legs = {
                Model = string.format("models/tnb/halflife2/cca/%s_legs_metropolice.mdl", gender),
                Skin = 3
            }
        }
	end
end

return ITEM
