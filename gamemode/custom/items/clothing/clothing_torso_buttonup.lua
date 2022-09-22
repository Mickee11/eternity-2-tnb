ITEM = class.Create("base_clothing")

ITEM.Name 				= "Button Up"
ITEM.Description 		= "Love a man in a uniform."

ITEM.Model 				= Model("models/props_junk/cardboard_box003a.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_CLOTHING
ITEM.UnitPrice 			= 130
ITEM.SellPrice 			= 55

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Wear Normal",
		Callback = function()
			self.Badge = 1
			
			ply:HandlePlayerModel()
		end
	})

	return table.Add(tab, self:ParentCall("GetContextOptions", ply))

end 

if SERVER then
	function ITEM:GetModelData(ply)
		return {
			torso = {
				Model = Model(string.format("models/mist/security/%s_security_top.mdl", GAMEMODE:GetGenderString(ply:CharModel()))),
				Bodygroups = {
					badge = self.Badge or 0
				}
			}
		}
	end
end

return ITEM
