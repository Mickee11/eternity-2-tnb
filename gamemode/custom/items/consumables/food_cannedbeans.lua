ITEM = class.Create("base_consumable")

ITEM.Name 				= "Canned Beans"
ITEM.Description 		= "A can of old, likely expired beans."

ITEM.Model 				= Model("models/props_junk/garbage_metalcan002a.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 15
ITEM.SellPrace			= 15

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 150, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM