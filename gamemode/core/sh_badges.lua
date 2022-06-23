local meta = FindMetaTable("Player")

local badges = {
	admin = {Name = "Administrator", Material = Material("icon16/shield.png")},
	superadmin = {Name = "Super Administrator", Material = Material("icon16/shield_add.png")},
	dev = {Name = "Eternity Developer", Material = Material("icon16/tag.png")},
	rda = {Name = "Roleplay Department Administrator", Material = Material("icon16/user_gray.png")},
	sea = {Name = "Senior Executive Administrator", Material = Material("icon16/user_suit.png")},
	OOC = {Name = "Out-Of-Character Muted", Material = Material("icon16/keyboard_mute.png")},
}

if CLIENT then
	function meta:GetBadges()
		local tab = {}

		if (self:AdminHidden() and LocalPlayer():IsAdmin()) or not self:AdminHidden() then
			if self:IsSEA() then
				table.insert(tab, badges.sea)
			elseif self:IsRDA() then
				table.insert(tab, badges.rda)
			elseif self:IsDeveloper() then
				table.insert(tab, badges.dev)
			elseif self:IsSuperAdmin() then
				table.insert(tab, badges.superadmin)
			elseif self:IsAdmin() then
				table.insert(tab, badges.admin)
			end
		end

		if self:TopDonatorPackage() ~= nil and (not self:IsDonatorHidden() or LocalPlayer():IsAdmin() or self == LocalPlayer()) then
			table.insert(tab, DONATORPACKAGES[self:TopDonatorPackage()])
		end

		if (LocalPlayer():IsAdmin() or self == LocalPlayer()) and not self:IsAdmin() then
			for k,v in pairs(PERMISSIONS) do
				if self:HasPermissionSaved(k) then
					table.insert(tab, v)
				end

				if self:HasPermissionTemporary(k) then
					local temp = table.Copy(v)
					temp.Name = temp.Name .. " (Temporary)"
					table.insert(tab, temp)
				end
			end
		end

		if self:OOCMuted() then
			table.insert(tab, badges.OOC)
		end

		for k, v in pairs(BADGES) do
			if self:HasBadge(k) then
				table.insert(tab, v)
			end
		end

		return tab
	end
end

function meta:HasBadge(id)
	return tobool(bit.band(self:Badges(), 2^(id - 1)))
end

function meta:GiveBadge(id)
	if self:HasBadge(id) then
		return
	end

	self:SetBadges(self:Badges() + 2^(id - 1))
end

function meta:TakeBadge(id)
	if not self:HasBadge(id) then
		return
	end

	self:SetBadges(self:Badges() - 2^(id - 1))
end