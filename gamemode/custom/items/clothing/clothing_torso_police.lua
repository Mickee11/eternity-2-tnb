ITEM = class.Create("base_clothing")

ITEM.Name 				= "Police Uniform Top"
ITEM.Description 		= "The upper half of a police uniform."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Vest",
		Callback = function()
			self.Vest = 1
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Remove Vest",
		Callback = function()
			self.Vest = 0
			
			ply:HandlePlayerModel()
		end
	})

		table.insert(tab, {
			Name = "Wear Toolbelt",
			Callback = function()
				self.Toolbelt = 1

				ply:HandlePlayerModel()
			end
		})

		table.insert(tab, {
			Name = "Remove Toolbelt",
			Callback = function()
				self.Toolbelt = 0

				ply:HandlePlayerModel()
			end
		})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/mist/police/%s_officer_top.mdl", GAMEMODE:GetGenderString(ply:CharModel()))), -- how to tell what is male and female
				Bodygroups = {
					vest = self.Vest or 0,
					toolbelt = self.Toolbelt or 0
				}
			}
		}
	end
end

return ITEM
