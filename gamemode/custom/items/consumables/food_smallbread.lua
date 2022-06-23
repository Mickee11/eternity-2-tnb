ITEM = class.Create("base_consumable")

ITEM.Name 				= "Small Bread Loaf"
ITEM.Description 		= "A small, fresh piece of bread offered to citizens."

ITEM.Model 				= Model("models/props_hla/food/bread_roll.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 15
ITEM.SellPrace			= 10

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 125, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM