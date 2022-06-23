ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Normal Headcrab Heart"
ITEM.Description 		= "The cooked heart of a Headcrab. Still a stringy and chewy piece of non-sanctioned meat."

ITEM.Model 				= Model("models/xen/headcrab_gland.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 111, 63)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 225, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM