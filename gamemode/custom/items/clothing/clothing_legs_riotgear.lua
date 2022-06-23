ITEM = class.Create("base_clothing")

ITEM.Name 				= "Police Riot Pants"
ITEM.Description 		= "A half to one set of old, repurposed riot police gear."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_workpants.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 5000
ITEM.SellPrice 			= 4000

ITEM.ArmorLevel			= ARMOR_LIGHT

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/male_legs_riot.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = 0
            }
		}
	end
end

return ITEM
