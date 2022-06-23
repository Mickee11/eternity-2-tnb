ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Antlion Guard Meat"
ITEM.Description 		= "A cooked piece of stringy, fatty, and chewy non-sanctioned meat. It's massive."

ITEM.Model 				= Model("models/gibs/antlion_gib_large_3.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 111, 63)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 450, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM