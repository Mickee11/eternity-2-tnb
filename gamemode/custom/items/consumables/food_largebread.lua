ITEM = class.Create("base_consumable")

ITEM.Name 				= "Large Bread Loaf"
ITEM.Description 		= "A large, fresh piece of bread offered to priority citizens."

ITEM.Model 				= Model("models/props_hla/food/bread.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 150, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM