ITEM = class.Create("base_consumable")

ITEM.Name 				= "Vanilla Crackers"
ITEM.Description 		= "A box of generic, stale crackers. Vanilla flavored."

ITEM.Model 				= Model("models/props_hla/props/cracker_box.mdl")

ITEM.Height 			= 1

ITEM.License 			= LICENSE_FOOD
ITEM.UnitPrice			= 20
ITEM.SellPrace			= 20

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 125, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM