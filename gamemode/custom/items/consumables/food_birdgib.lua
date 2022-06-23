ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Bird Meat"
ITEM.Description 		= "A raw portion of less than flavorful meat."

ITEM.Model 				= Model("models/gibs/antlion_gib_small_1.mdl")
ITEM.Skin               = 1

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 15
ITEM.SellPrice 			= 10

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 50, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM