ITEM = class.Create("base_consumable")

ITEM.Name 				= "Watermelon Slice"
ITEM.Description 		= "A healthy,massive, snack."

ITEM.Model 				= Model("models/props_junk/watermelon01_chunk01b.mdl")

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