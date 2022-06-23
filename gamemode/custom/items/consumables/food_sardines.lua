ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Sardines"
ITEM.Description 		= "A tin of raw, ready-to-eat sardines."

ITEM.Model 				= Model("models/props_hla/props/sardine_tin.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 20
ITEM.SellPrace			= 10

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 200, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM