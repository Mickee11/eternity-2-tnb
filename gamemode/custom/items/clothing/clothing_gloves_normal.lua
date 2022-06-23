ITEM = class.Create("base_clothing")

ITEM.Name 				= "Normal Gloves"
ITEM.Description 		= "A pair of gloves to keep your hands warm."

ITEM.Model 				= Model("models/tnb/items/gloves.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_GLOVES}

ITEM.ItemGroup 			= "Clothing"

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 40
ITEM.SellPrice 			= 15

ITEM.Gloves 			= true

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			hands = {
				Model = string.format("models/tnb/halflife2/hands_%s.mdl", GAMEMODE:GetGenderString(ply:CharModel())),
				Skin = GAMEMODE:GetModelSkinTone(ply:CharModel()),
				Bodygroups = {
					[1] = 1
				}
			}
		}
	end
end

return ITEM
