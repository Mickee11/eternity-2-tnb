local meta = FindMetaTable("Player")

function meta:IsInEditMode()
	if not self:IsAdmin() then
		return false
	end

	return self:EditMode()
end

function meta:IsAdmin()
	return self:AdminLevel() >= USERGROUP_ADMIN
end

function meta:IsSuperAdmin()
	return self:AdminLevel() >= USERGROUP_SUPERADMIN
end

function meta:IsDeveloper()
	return self:AdminLevel() >= USERGROUP_DEV
end

function meta:IsRDA()
	return self:AdminLevel() >= USERGROUP_RDA
end

function meta:IsSEA()
	return self:AdminLevel() >= USERGROUP_SEA
end

function meta:IsInNoClip()
	return self:IsEFlagSet(EFL_NOCLIP_ACTIVE)
end

function GM:PlayerNoClip(ply, on)
	if ply:ShouldLockInput() then
		return false
	end

	local weapon = ply:GetActiveWeapon()

	if not on then
		ply:SetNoDraw(false)
		ply:SetNotSolid(false)

		ply:HandleWeaponDraw(weapon)

		if SERVER then
			ply:SetNoTarget(false)

			entsound.Play(ply, ENTSOUND_IDLE)
		end

		return true
	elseif ply:IsAdmin() or ply:HasPermission(PERMISSION_OBSERVER) then
		ply:SetNoDraw(true)
		ply:SetNotSolid(true)

		ply:HandleWeaponDraw(weapon)

		if SERVER then
			ply:SetNoTarget(true)

			entsound.Silence(ply)
		end

		return true
	end

	return false
end

if SERVER then
	hook.Add("PlayerAdminLevelChanged", "admin.PlayerAdminLevelChanged", function(ply, old, new)
		if new == USERGROUP_PLAYER then
			ply:SetUserGroup("user")
		elseif new == USERGROUP_ADMIN then
			ply:SetUserGroup("admin")
		elseif new == USERGROUP_SUPERADMIN or new == USERGROUP_DEV or new == USERGROUP_RDA then
			ply:SetUserGroup("superadmin")
		end
	end)
end
