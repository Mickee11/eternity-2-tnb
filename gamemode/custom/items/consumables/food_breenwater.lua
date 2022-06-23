ITEM = class.Create("base_consumable")

ITEM.Name 				= "Dr. Breen's Private Reserve"
ITEM.Description 		= "Just a normal can of seltzer water. Tastes fishy."

ITEM.Model 				= Model("models/props_junk/popcan01a.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 5
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 50, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM