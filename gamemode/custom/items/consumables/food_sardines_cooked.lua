ITEM = class.Create("base_consumable")

ITEM.Name 				= "Cooked Sardines"
ITEM.Description 		= "A tin of cooked, ready-to-eat sardines."

ITEM.Model 				= Model("models/props_hla/props/sardine_tin.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 350, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM