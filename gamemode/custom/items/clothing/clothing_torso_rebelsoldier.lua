ITEM = class.Create("base_clothing")

ITEM.Name 				= "Resistance Overwatch Gear"
ITEM.Description 		= "Retooled Overwatch gear for the resistance freedom fighter."

ITEM.Model 				= Model("models/tnb/items/shirt_rebeloverwatch.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.ArmorLevel 		= ARMOR_HEAVY

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

ITEM.Variant = 0

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Select variant",
		Client = function()
			return GAMEMODE:OpenGUI("Input", "number", "Select variant", {
				Default = self.Variant
			})
		end,
		Callback = function(num)
			if not GAMEMODE:CheckInput("number", {}, val) then
				return
			end

			self.Variant = tonumber(num)

			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		local model = "models/tnb/halflife/%s_torso_cotavest_redone.mdl"

		return {
			torso = {
				Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = math.Clamp(self.Variant, 0, 5)
			}
		}
	end
end

return ITEM
