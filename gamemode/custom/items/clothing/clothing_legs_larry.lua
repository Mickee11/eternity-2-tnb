ITEM = class.Create("base_clothing")

ITEM.Name 				= "Larry's Pants"
ITEM.Description 		= "DOES LOOK ALL THAT SHIT."

ITEM.Model 				= Model("models/tnb/halflife/world_legs_larry.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

--ITEM.License 			= LICENSE_CLOTHING
--ITEM.UnitPrice 			= 80
--ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_larry.mdl", GAMEMODE:GetGenderString(ply:CharModel())))            }
		}
	end
end

return ITEM
