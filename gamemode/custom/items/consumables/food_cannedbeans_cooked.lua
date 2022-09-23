ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Beans"
ITEM.Description 		= "A pot of warm beans."

ITEM.Model 				= Model("models/props_interiors/pot02a.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 400, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM