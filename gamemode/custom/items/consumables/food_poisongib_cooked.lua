ITEM = class.Create("base_consumable")

ITEM.Name 				= "Boiled Poisonous Headcrab Heart"
ITEM.Description 		= "The boiled off-color heart of a Poisonous Headcrab. A stringy, chewy piece of non-sanctioned meat."

ITEM.Model 				= Model("models/xen/headcrab_gland.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 259, 255)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 260, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM