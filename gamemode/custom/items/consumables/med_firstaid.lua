ITEM = class.Create("base_consumable")

ITEM.Name 				= "Medigel First-Aid Kit"
ITEM.Description 		= "A Combine-produced medical aid kit."

ITEM.Model 				= Model("models/items/healthkit.mdl")

ITEM.Width 				= 2

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice			= 650
ITEM.SellPrace			= 150

ITEM.UseTarget 			= true
ITEM.TargetString 		= "Heal Target"

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Heal Self"

function ITEM:IsValidTarget(target)
	return target:IsPlayer() and target:Health() < target:GetMaxHealth()
end

if SERVER then
	function ITEM:OnTargetUse(ply, target)
		ply:VisibleMessage(string.format("%s applies first-aid to %s.", ply:VisibleRPName(), target:VisibleRPName()))
		
		target:SetHealth(math.Clamp(target:Health() + 60, 0, target:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end

	function ITEM:OnSelfUse(ply)
		ply:SendChat("NOTICE", "You apply first-aid to yourself.")
		
		ply:SetHealth(math.Clamp(ply:Health() + 60, 0, ply:GetMaxHealth()))

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM