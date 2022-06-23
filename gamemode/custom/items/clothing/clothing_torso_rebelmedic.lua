ITEM = class.Create("base_clothing")

ITEM.Name 				= "Resistance Medic Gear"
ITEM.Description 		= "Retooled gear for the resistance freedom fighter."

ITEM.Model 				= Model("models/tnb/items/shirt_medic1.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 3
ITEM.Height 			= 2

ITEM.ArmorLevel 		= ARMOR_LIGHT

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 5000
ITEM.SellPrice 			= 2000

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
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

	table.insert(tab, {
		Name = "Wear Grey Variant",
		Callback = function()
			self.Variant = 1
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Variant = 2
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Light Green Variant",
		Callback = function()
			self.Variant = 3
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Light Grey Variant",
		Callback = function()
			self.Variant = 4
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Variant",
		Callback = function()
			self.Variant = 5
			
			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		local variant = self.Variant or 0
		local model = "models/tnb/halflife/%s_torso_medic1.mdl"

		if variant >= 3 then
			variant = variant - 3
			model = "models/tnb/halflife/%s_torso_medic2.mdl"
		end

		return {
			torso = {
				Model = Model(string.format(model, GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = variant
			}
		}
	end
end

return ITEM
