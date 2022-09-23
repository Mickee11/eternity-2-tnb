ITEM = class.Create("base_consumable")

ITEM.Name 				= "Milk"
ITEM.Description 		= "A carton of milk."

ITEM.Model 				= Model("models/props_junk/garbage_milkcarton002a.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 15
ITEM.SellPrace			= 5

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 100, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM