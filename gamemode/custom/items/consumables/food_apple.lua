ITEM = class.Create("base_consumable")

ITEM.Name 				= "Apple"
ITEM.Description 		= "A healthy, out-of-place snack in the new world."

ITEM.Model 				= Model("models/props/de_inferno/crate_fruit_break_gib2.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 10
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 125, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM