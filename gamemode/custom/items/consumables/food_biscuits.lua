ITEM = class.Create("base_consumable")

ITEM.Name 				= "Biscuits"
ITEM.Description 		= "A stale snack to go with your Breen Water."

ITEM.Model 				= Model("models/props_hla/props/biscuits.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 20
ITEM.SellPrace			= 15

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 200, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM