ITEM = class.Create("base_clothing")

ITEM.Name 				= "Slack Jeans"
ITEM.Description 		= "A nice, clean set of jeans with some boots. Comes in a few colors."

ITEM.Model 				= Model("models/tnb/items/pants_citizen.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 80
ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.ArmorLevel			= ARMOR_NONE

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Blue Variant",
		Callback = function()
			self.Variant = 0
			
			ply:HandlePlayerModel()
		end
	})

	if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE then
		table.insert(tab, {
			Name = "Wear Khaki Variant",
			Callback = function()
				self.Variant = 1
				
				ply:HandlePlayerModel()
			end
		})
	end

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Variant = 2
			
			ply:HandlePlayerModel()
		end
	})


	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		print(self.Variant or 0)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_slackjeans.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = self.Variant or 0
            }
		}
	end
end

return ITEM
