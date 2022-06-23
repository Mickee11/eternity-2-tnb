ITEM = class.Create("base_clothing")

ITEM.Name 				= "Police Riot Gear"
ITEM.Description 		= "A half to one set of old, repurposed riot police gear."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_workpants.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 8000
ITEM.SellPrice 			= 6000

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/male_torso_riot.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 0
            }
		}
	end
end

return ITEM
