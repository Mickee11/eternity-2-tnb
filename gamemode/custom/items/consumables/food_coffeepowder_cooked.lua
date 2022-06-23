ITEM = class.Create("base_consumable")

ITEM.Name 				= "Coffee"
ITEM.Description 		= "A cup of coffee brewed alongside Breen's Private Reserve."

ITEM.Model 				= Model("models/props_junk/garbage_coffeemug001a.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 200, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM