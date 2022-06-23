ITEM = class.Create("base_consumable")

ITEM.Name 				= "Medigel Injector"
ITEM.Description 		= "A Combine-produced, single-use needle. Filled with medigel."

ITEM.Model 				= Model("models/props_hla/props/health_syringe.mdl")

ITEM.Width 				= 1

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice			= 400
ITEM.SellPrace			= 100

ITEM.UseTarget 			= true
ITEM.TargetString 		= "Heal Target"

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

function ITEM:IsValidTarget(target)
	return target:IsPlayer() and target:Health() < target:GetMaxHealth()
end

if SERVER then
	function ITEM:OnTargetUse(ply, target)
		ply:VisibleMessage(string.format("%s injects %s with fast-acting medigel.", ply:VisibleRPName(), target:VisibleRPName()))

		target:SetHealth(math.Clamp(target:Health() + 25, 0, target:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end

	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You inject yourself with fast-acting medigel.")

		ply:SetHealth(math.Clamp(ply:Health() + 25, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM
