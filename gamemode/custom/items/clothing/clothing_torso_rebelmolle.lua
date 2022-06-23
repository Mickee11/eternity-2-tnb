ITEM = class.Create("base_clothing")

ITEM.Name 				= "Resistance Molle Vest"
ITEM.Description 		= "A heavy vest for a strong resistance fighter."

ITEM.Model 				= Model("models/tnb/items/shirt_rebel_molle.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.ArmorLevel 		= ARMOR_HEAVY

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}


ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Blue Variant",
		Callback = function()
			self.Skin = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Grey Variant",
		Callback = function()
			self.Skin = 1
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Skin = 2
			
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
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife2/%s_torso_molle1.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin
			}
		}
	end
end

return ITEM