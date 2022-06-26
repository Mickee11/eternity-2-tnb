local meta = FindMetaTable("Player")

GM.ItemClasses = GM.ItemClasses or {}

hook.Add("Initialize", "items.Initialize", function()
	GAMEMODE:LoadItems()
end)

hook.Add("OnReloaded", "items.OnReloaded", function()
	GAMEMODE:LoadItems()
end)

function GM:LoadItems()
	log.Default("[mounting] Registering item from core gamemode")

	-- Template Registration
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_item")
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_radio.lua")
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_stacking.lua")
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_ammo.lua")
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_weapon.lua")
	self:RegisterItem(includes.CurrentFolder(1) .. "items/base_throwable.lua")

	-- Generic / Miscellanious
	self:RegisterItemFolder("items/generic/ammo")
	self:RegisterItemFolder("items/generic/currency")
	self:RegisterItemFolder("items/generic/radio")
	self:RegisterItemFolder("items/generic")

	-- Weapons
	self:RegisterItemFolder("items/weapons")

	log.Default("[mounting] Registering items from custom modules")

	hook.Run("EternityPostLoadItems")
end

function GM:RegisterItem(path)
	local ret

	if string.Right(path, 4) != ".lua" then
		ret = includes.File(path .. "/sh_init.lua")
	else
		ret = includes.File(path)
	end

	path = string.Filename(path)

	class.Register(path, ret)

	if string.Left(path, 4) != "base" and not ret.BlockSpawn then
		self.ItemClasses[path] = true
	end

	ITEM = nil
end

function GM:RegisterItemFolder(path)
	local src = includes.CurrentFolder(2) .. path .. "/"
	local files = file.Find(src .. "*", "LUA")

	for _, v in SortedPairs(files) do
		self:RegisterItem(src .. v)
	end
end

function GM:GetItem(id)
	return class.GetNetworked("Items", id)
end

function meta:GetItemDropLocation()
	local tr = util.TraceLine({
		start = self:EyePos(),
		endpos = self:EyePos() + (self:GetAimVector() * 50),
		filter = self
	})

	return tr.HitPos + (tr.HitNormal * 10)
end