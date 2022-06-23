ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked SPAM"
ITEM.Description 		= "A can of cooked, ready-to-eat pretend-meat."

ITEM.Model 				= Model("models/props_hla/props/spam.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 400, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM