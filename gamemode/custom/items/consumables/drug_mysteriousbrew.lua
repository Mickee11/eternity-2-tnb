ITEM = class.Create("base_consumable")

ITEM.Name 				= "Mysterious Brew"
ITEM.Description 		= "It... looks like sewage."

ITEM.Model 				= Model("models/props_junk/garbage_coffeemug001a.mdl")

ITEM.Height 			= 1
ITEM.UseSelf 			= true
ITEM.SelfString 		= "Drink"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:VisibleMessage(ply:VisibleRPName() .. " drinks from a foul smelling mug. They pass out shortly after.")

		ply:TakeCDamage(100)

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM