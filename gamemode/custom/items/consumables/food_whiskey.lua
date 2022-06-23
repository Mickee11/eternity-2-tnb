ITEM = class.Create("base_consumable")

ITEM.Name 				= "Whiskey"
ITEM.Description 		= "A surprisingly strong alcholic beverage allowed by the Combine."

ITEM.Model 				= Model("models/props_junk/glassjug01.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 50
ITEM.SellPrace			= 20

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 100, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM