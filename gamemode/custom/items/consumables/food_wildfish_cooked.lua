ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Wild Fish"
ITEM.Description 		= "A rare specimen only found outside the city walls."

ITEM.Model 				= Model("models/props/cs_militia/fishriver01.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 111, 63)
ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 225, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM