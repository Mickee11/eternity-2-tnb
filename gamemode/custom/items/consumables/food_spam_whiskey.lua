ITEM = class.Create("base_consumable")

ITEM.Name 				= "Whiskey-SPAM"
ITEM.Description 		= "Eating your drinks? That is genius."

ITEM.Model 				= Model("models/props_hla/props/spam.mdl")

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "I'M SORRY RUM HAM.")

		ply:SetHungerBar(math.Clamp(ply:HungerBar() - 500, 0, GAMEMODE:GetConfig("HungerMax")))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM