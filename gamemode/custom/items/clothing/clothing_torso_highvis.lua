ITEM = class.Create("base_clothing")

ITEM.Name 				= "High Visibility Jacket"
ITEM.Description 		= "A high-visibility jacket worn by Combine employees. Waterproof."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen2.mdl")
ITEM.Skin 				= 3

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Yellow Variant",
		Callback = function()
			self.Skin = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Orange Variant",
		Callback = function()
			self.Skin = 1
			
			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
                Model = Model(string.format("models/tnb/halflife2/%s_torso_workjacket.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
                Skin = self.Skin
			}
		}
	end
end

return ITEM
