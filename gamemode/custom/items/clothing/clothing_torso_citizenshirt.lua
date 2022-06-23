ITEM = class.Create("base_clothing")

ITEM.Name 				= "Citizen Shirt"
ITEM.Description 		= "A simple, but Combine-approved piece of clothing. Comes in a variety of forms."

ITEM.Model 				= Model("models/tnb/items/shirt_citizen1.mdl")
ITEM.Skin 				= 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 70
ITEM.SellPrice 			= 25

ITEM.ItemGroup 			= "Clothing"

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

	table.insert(tab, {
		Name = "Wear C8 Variant",
		Callback = function()
			self.Variant = 1
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear White Variant",
		Callback = function()
			self.Variant = 2
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Zipped Variant",
		Callback = function()
			self.Variant = 3
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Faded Variant",
		Callback = function()
			self.Variant = 4
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Green Variant",
		Callback = function()
			self.Variant = 5
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Grey Variant",
		Callback = function()
			self.Variant = 6
			
			ply:HandlePlayerModel()
		end
	})

	table.insert(tab, {
		Name = "Wear Black Unzipped Variant",
		Callback = function()
			self.Variant = 7
			
			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))
end

if SERVER then
	function ITEM:GetModelData(ply)
		local variant = self.Variant or 0
		local model = "models/tnb/halflife/%s_torso_citizen1.mdl"

		if variant >= 4 then
			variant = variant - 4
			model = "models/tnb/halflife/%s_torso_citizen2.mdl"
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
