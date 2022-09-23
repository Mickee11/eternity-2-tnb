ITEM = class.Create("base_consumable")

ITEM.Name 				= "Sparkling Water"
ITEM.Description 		= "A can of sparkling water. Very bubbly."

ITEM.Model 				= Model("models/props/cs_office/trash_can_p8.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 15
ITEM.SellPrace			= 10

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 75, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM