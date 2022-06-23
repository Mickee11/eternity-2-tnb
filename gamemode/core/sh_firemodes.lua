GM.Ammo = {}

hook.Add("Initialize", "firemodes.Initialize", function()
	GAMEMODE:LoadFiremodes()
end)

hook.Add("OnReloaded", "firemodes.OnReloaded", function()
	GAMEMODE:LoadFiremodes()
end)

function GM:LoadFiremodes()
	log.Default("[mounting] Registering firemodes from core gamemode")

	self:RegisterFiremode(includes.CurrentFolder(1) .. "classes/firemodes/firemode_semi.lua")
	self:RegisterFiremode(includes.CurrentFolder(1) .. "classes/firemodes/firemode_auto.lua")
	self:RegisterFiremode(includes.CurrentFolder(1) .. "classes/firemodes/firemode_vfire.lua")
	self:RegisterFiremode(includes.CurrentFolder(1) .. "classes/firemodes/firemode_sputter.lua")

	log.Default("[mounting] Registering firemodes from custom modules")

	hook.Run("EternityPostLoadFiremodes")
end

function GM:RegisterFiremode(path)
	local ret

	if string.Right(path, 4) != ".lua" then
		ret = includes.File(path .. "/sh_init.lua")
	else
		ret = includes.File(path)
	end

	path = string.Filename(path)

	class.Register(path, ret)

	FIREMODE = nil
end
