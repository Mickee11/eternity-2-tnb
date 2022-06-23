ITEM = class.Create("base_consumable")

ITEM.Name 				= "Trapped Antlion Grub"
ITEM.Description 		= "A baby grub. Can be ground up into unconcentrated medigel."

ITEM.Model 				= Model("models/props_hla/props/grub.mdl")

ITEM.Width 				= 2

ITEM.UseTarget 			= true
ITEM.TargetString 		= "Heal Target"

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

function ITEM:IsValidTarget(target)
	return target:IsPlayer() and target:Health() < target:GetMaxHealth()
end

if SERVER then
	function ITEM:OnTargetUse(ply, target)
		ply:VisibleMessage(string.format("%s applies grub-goo onto %s's wounds.", ply:VisibleRPName(), target:VisibleRPName()))
		
		target:SetHealth(math.Clamp(target:Health() + 40, 0, target:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end

	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You apply grub-goo to your wounds.")
		
		ply:SetHealth(math.Clamp(ply:Health() + 40, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM