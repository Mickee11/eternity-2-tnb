ITEM = class.Create("base_clothing")

ITEM.Name 				= "Fingerless Gloves"
ITEM.Description 		= "While not as warm as a full set of gloves, they do look stylish."

ITEM.Model 				= Model("models/tnb/items/gloves.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_GLOVES}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 30
ITEM.SellPrice 			= 10

ITEM.Gloves 			= true

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			hands = {
				Model = string.format("models/tnb/halflife2/hands_%s.mdl", GAMEMODE:GetGenderString(ply:CharModel())),
				Skin = GAMEMODE:GetModelSkinTone(ply:CharModel()),
				Bodygroups = {
					[1] = 2
				}
			}
		}
	end
end

return ITEM
