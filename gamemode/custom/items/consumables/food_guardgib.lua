ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Antlion Guard Meat"
ITEM.Description 		= "A stringy, fatty, and chewy piece of non-sanctioned meat. It's a massive piece of meat."

ITEM.Model 				= Model("models/gibs/antlion_gib_large_3.mdl")
ITEM.Skin               = 1

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 25
ITEM.SellPrice 			= 10

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 175, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM