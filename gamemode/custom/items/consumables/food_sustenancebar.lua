ITEM = class.Create("base_consumable")

ITEM.Name 				= "Desiccated Sustenance Bar"
ITEM.Description 		= "A vacuum sealed bag containing a dry, odorless food bar. Tastes like rain runoff."

ITEM.Model 				= Model("models/props_hla/props/ration.mdl")

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