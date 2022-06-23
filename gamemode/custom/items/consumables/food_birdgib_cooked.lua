ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Bird Meat"
ITEM.Description 		= "A cooked portion of less than flavorful meat."

ITEM.Model 				= Model("models/gibs/antlion_gib_small_1.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 111, 63)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 165, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM