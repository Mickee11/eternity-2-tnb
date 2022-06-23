ITEM = class.Create("base_consumable")

ITEM.Name 				= "Beer Bottle"
ITEM.Description 		= "An unidentifiable, miserable-tasting Combine produced beer."

ITEM.Model 				= Model("models/props_junk/glassbottle01a.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 10
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 20, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM