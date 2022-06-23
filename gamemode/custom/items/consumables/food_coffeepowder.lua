ITEM = class.Create("base_consumable")

ITEM.Name 				= "Instant Coffee Powder"
ITEM.Description 		= "A dry, lackluster excuse of a drink."

ITEM.Model 				= Model("models/props_hla/props/coffee.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 10
ITEM.SellPrace			= 10

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 100, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM