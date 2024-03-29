local meta = FindMetaTable("Player")

function meta:GetBuyableItems()
	local tab = {}

	for k in pairs(GAMEMODE.ItemClasses) do
		local item = class.Get(k)

		if item == nil or not item.License then
			continue
		end

		if LICENSES[item.License].City and GAMEMODE:WorldArea() > WORLDAREA_CITY then
			continue
		end

		-- Strange fluke.
		if not self:HasLicense(item.License) then
			continue
		end

		table.insert(tab, k)
	end

	return tab
end

function meta:CanBuyItem(classname, amount)
	if self:Restrained() then
		return false
	end

	if not class.Exists(classname) then
		return false
	end

	local item = class.Get(classname)

	if not item.License then
		return false
	end

	if not self:HasLicense(item.License) then
		return false
	end

	if item.UnitPrice > 0 and not self:HasMoney(math.ceil(item.UnitPrice * amount)) then
		return false
	end

	return true
end

function meta:CanSellItem(item)
	if not item:CanInteract(self) then
		return false
	end

	if not item.License then
		return false
	end

	if not self:HasLicense(item.License) then
		return false
	end

	if item.SellPrice <= 0 then
		return false
	end

	return true
end

function meta:GetMoney()
	return self:GetItemCount(GAMEMODE:GetConfig("DefaultCurrency"), true, false)
end

function meta:HasMoney(amount)
	return self:HasItem(GAMEMODE:GetConfig("DefaultCurrency"), amount)
end

function meta:GetLicenses()
	local tab = {}

	for k in pairs(LICENSES) do
		if self:HasLicense(k) then
			table.insert(tab, k)
		end
	end

	return tab
end

function meta:HasLicense(id)
	return tobool(bit.band(self:BusinessLicenses(), 2^(id - 1)))
end