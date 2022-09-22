ITEM = class.Create("base_clothing")

ITEM.Name 				= "Sheriff Pants"
ITEM.Description 		= "Law and order."

ITEM.Model 				= Model("models/tnb/items/pants_citizen.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 60
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}


if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/mist/sheriff/%s_sheriff_pants.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
            }
		}
	end
end

return ITEM
