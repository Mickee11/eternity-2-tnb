GM.Ammo = {}

hook.Add("Initialize", "ammo.Initialize", function()
	GAMEMODE:LoadAmmo()
end)

hook.Add("OnReloaded", "ammo.OnReloaded", function()
	GAMEMODE:LoadAmmo()
end)

function GM:LoadAmmo()
	log.Default("[mounting] Registering gameammo from core gamemode")

	self:RegisterAmmo(includes.CurrentFolder(1) .. "classes/gameammo/gameammo_ballistic.lua")
	self:RegisterAmmo(includes.CurrentFolder(1) .. "classes/gameammo/gameammo_projectile.lua")
	
	self:RegisterAmmoFolder("classes/gameammo/ballistic")
	self:RegisterAmmoFolder("classes/gameammo/projectile")

	log.Default("[mounting] Registering gameammo from custom modules")

	hook.Run("EternityPostLoadAmmo")
end

function GM:RegisterAmmo(path)
	local ret

	if string.Right(path, 4) != ".lua" then
		ret = includes.File(path .. "/sh_init.lua")
	else
		ret = includes.File(path)
	end

	path = string.Filename(path)

	class.Register(path, ret)

	if ret.Name != "" then
		self.Ammo[path] = class.Instance(path)
	end

	AMMO = nil
end

function GM:RegisterAmmoFolder(path)
	local src = includes.CurrentFolder(2) .. path .. "/"
	local files = file.Find(src .. "*", "LUA")

	for _, v in pairs(files) do
		self:RegisterAmmo(src .. v)
	end
end

function GM:GetAmmo(name)
	return self.Ammo[name]
end