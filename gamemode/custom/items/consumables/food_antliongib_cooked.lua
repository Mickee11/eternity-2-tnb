ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Antlion Leg"
ITEM.Description 		= "The cooked leg of an oversized bug. Still quite stringy, fatty, and chewy."

ITEM.Model 				= Model("models/gibs/antlion_gib_medium_2.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 111, 63)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 300, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM