ITEM = class.Create("base_clothing")

ITEM.Name 				= "Loyalist Pants"
ITEM.Description 		= "Specially tailored for those who've given their soul away."

ITEM.Model 				= Model("models/tnb/halflife/world_legs_white.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.EquipmentSlots 	= {EQUIPMENT_LEGS}

--ITEM.License 			= LICENSE_CLOTHING
--ITEM.UnitPrice 			= 80
--ITEM.SellPrice 			= 35

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {1, 2}
}

function ITEM:GetContextOptions(ply)
	local tab = {}

	if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE then
		table.insert(tab, {
			Name = "Wear Pants Variant",
			Callback = function()
				self.Skirt = 0
				
				ply:HandlePlayerModel()
			end
		})
	
		table.insert(tab, {
			Name = "Wear Skirt Variant",
			Callback = function()
				self.Skirt = 1
				
				ply:HandlePlayerModel()
			end
		})
	end

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetModelData(ply)
		if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE and self.Skirt and self.Skirt == 1 then
			return {
				legs = {
					Model = Model("models/tnb/halflife/female_legs_loyalist_skirt.mdl")
				}
			}
		end

		return {
			legs = {
				Model = Model(string.format("models/tnb/halflife/%s_legs_loyalist.mdl", GAMEMODE:GetGenderString(ply:CharModel())))
			}
		}
	end
end

return ITEM
