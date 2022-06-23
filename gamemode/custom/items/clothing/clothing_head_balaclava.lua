ITEM = class.Create("base_clothing")

ITEM.Name 				= "Black Balaclava"
ITEM.Description 		= "A black balaclava with accompanying ski goggles."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.EquipmentSlots 	= {EQUIPMENT_HEAD}

ITEM.ItemGroup 			= "Clothing"
ITEM.Filtered 			= false

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 150
ITEM.SellPrice 			= 60

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			_base = {
				HideHead = true
			},
			head = {
				Model = Model(string.format("models/tnb/halflife2/%s_head_balaclava.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
