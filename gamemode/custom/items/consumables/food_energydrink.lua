ITEM = class.Create("base_consumable")

ITEM.Name 				= "Energy Drink"
ITEM.Description 		= "A spoiled, less-than-tasty energy drink that's just a few days past due."

ITEM.Model 				= Model("models/props/cs_office/trash_can_p7.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 40
ITEM.SellPrace			= 25

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 200, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM