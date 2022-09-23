ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Wild Fish"
ITEM.Description 		= "Salmon."

ITEM.Model 				= Model("models/props/cs_militia/fishriver01.mdl")
ITEM.Skin               = 1

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 15
ITEM.SellPrice 			= 10

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 75, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM