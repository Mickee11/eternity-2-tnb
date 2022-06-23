ITEM = class.Create("base_consumable")

ITEM.Name 				= "Blasko Juice"
ITEM.Description 		= "It... looks like it doesn't belong in this universe."

ITEM.Model 				= Model("models/props_junk/garbage_glassbottle002a.mdl")

ITEM.Height 			= 1
ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:VisibleMessage(ply:VisibleRPName() .. " drinks from a foul smelling bottle.")

		ply:SetHungerBar(math.Clamp(ply:HungerBar() + math.random(1, 1000), 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM