ITEM = class.Create("base_consumable")

ITEM.Name 				= "Antibiotics"
ITEM.Description 		= "A small bottle with some pills. What's the worst that could happen?"

ITEM.Model 				= Model("models/props_hla/lab/pill_bottle2.mdl")

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice			= 150
ITEM.SellPrace			= 70

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

if SERVER then
	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You swallow an antibiotic pill.")

		ply:SetHealth(math.Clamp(ply:Health() + 15, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM