ITEM = class.Create("base_consumable")

ITEM.Name 				= "Dried Instant Noodles"
ITEM.Description 		= "A box of Combine-rebranded ramen noodles. No flavor packet."

ITEM.Model 				= Model("models/props_junk/garbage_takeoutcarton001a.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 10
ITEM.SellPrace			= 10

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 125, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM