local meta = FindMetaTable("Player")

function GM:HasPermission(permissions, perm)
	return tobool(bit.band(permissions, 2^(perm - 1)))
end

function meta:HasPermission(perm)
	return GAMEMODE:HasPermission(self:Permissions(), perm) or GAMEMODE:HasPermission(self:TempPermissions(), perm)
end

function meta:HasPermissionSaved(perm)
	return GAMEMODE:HasPermission(self:Permissions(), perm)
end

function meta:HasPermissionTemporary(perm)
	return GAMEMODE:HasPermission(self:TempPermissions(), perm)
end

if SERVER then
	function meta:GivePermissionTemporary(perm)
		if self:HasPermissionTemporary(perm) then
			return
		end

		self:SetTempPermissions(self:TempPermissions() + 2^(perm - 1))
	end

	function meta:TakePermissionTemporary(perm)
		if not self:HasPermissionTemporary(perm) then
			return
		end

		self:SetTempPermissions(self:TempPermissions() - 2^(perm - 1))
	end

	function meta:GivePermission(perm)
		if self:HasPermissionSaved(perm) then
			return
		end

		self:SetPermissions(self:Permissions() + 2^(perm - 1))
	end

	function meta:TakePermission(perm)
		if not self:HasPermissionSaved(perm) then
			return
		end

		self:SetPermissions(self:Permissions() - 2^(perm - 1))
	end
end