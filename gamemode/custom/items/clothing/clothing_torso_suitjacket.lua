ITEM = class.Create("base_clothing")

ITEM.Name 				= "Suit Jacket"
ITEM.Description 		= "A formal jacket for high-ranking officials."

ITEM.Model 				= Model("models/tnb/halflife/world_torso_suit.mdl")
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
		Name = "Wear White Variant",
		Callback = function()
			self.Skin = 0
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Variant",
		Callback = function()
			self.Skin = 1
			
			ply:HandlePlayerModel()
		end
	})

	if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_MALE then
		table.insert(tab, {
			Name = "Set Tie: Black",
			Callback = function()
				self.TieGroup = 0

				ply:HandlePlayerModel()
			end
		})

		table.insert(tab, {
			Name = "Set Tie: White",
			Callback = function()
				self.TieGroup = 1

				ply:HandlePlayerModel()
			end
		})

		table.insert(tab, {
			Name = "Set Tie: Red",
			Callback = function()
				self.TieGroup = 2

				ply:HandlePlayerModel()
			end
		})
	end

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/tnb/halflife/%s_torso_suit_white.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin,
				Bodygroups = {
					ties = self.TieGroup or 0
				}
			}
		}
	end
end

return ITEM
