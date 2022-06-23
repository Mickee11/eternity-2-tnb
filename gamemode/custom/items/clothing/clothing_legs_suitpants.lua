ITEM = class.Create("base_clothing")

ITEM.Name 				= "Suit Pants"
ITEM.Description 		= "A formal set of pants for high-ranking officials."

ITEM.Model 				= Model("models/tnb/halflife2/world_legs_suit.mdl")
ITEM.SKin = 0

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

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

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_suit_white.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Skin = self.Skin
			}
		}
	end
end

return ITEM
