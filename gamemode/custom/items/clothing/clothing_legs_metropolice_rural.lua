ITEM = class.Create("base_clothing")

ITEM.Name 				= "Rural Protection Slacks"
ITEM.Description 		= "A grey, standard issue uniform for Rural Protection units."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_metropolice.mdl")
ITEM.Skin 				= 2

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ArmorLevel 		= ARMOR_BASIC

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
                Skin = 0,
                Material = "models/tnb/cca/metropolice_body_rupol"
            }
        }
	end
end

return ITEM
