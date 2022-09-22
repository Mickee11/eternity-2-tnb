ITEM = class.Create("base_clothing")

ITEM.Name 				= "RCMP Top"
ITEM.Description 		= "Yes...It's them."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_plaid.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 130
ITEM.SellPrice 			= 55

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/mist/redcop/%s_red_top.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
