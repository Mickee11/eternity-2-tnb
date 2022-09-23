ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Instant Noodles"
ITEM.Description 		= "A box of Ramen noodles."

ITEM.Model 				= Model("models/props_junk/garbage_takeoutcarton001a.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 375, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM