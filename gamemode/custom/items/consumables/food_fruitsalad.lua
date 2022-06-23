ITEM = class.Create("base_consumable")

ITEM.Name 				= "Fruit Salad"
ITEM.Description 		= "Rebels need not apply."

ITEM.Model 				= Model("models/props/cs_office/trash_can_p5.mdl")

ITEM.Color				= Color(191, 255, 127)

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 275, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM