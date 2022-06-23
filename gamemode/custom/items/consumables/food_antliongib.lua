ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Antlion Leg"
ITEM.Description 		= "A stringy, fatty, and chewy piece of non-sanctioned meat. The rest of the bug is practically uneatable."

ITEM.Model 				= Model("models/gibs/antlion_gib_medium_2.mdl")
ITEM.Skin               = 1

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 15
ITEM.SellPrice 			= 10

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 100, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM