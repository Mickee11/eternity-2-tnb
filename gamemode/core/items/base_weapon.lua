ITEM = class.Create("base_item")

ITEM.Model 				= Model("models/weapons/w_mach_m249para.mdl")

ITEM.ItemGroup 			= "Equipment"

ITEM.OverrideBlacklist 	= {
	["Overrides"] = true,
	["OverrideBlacklist"] = true,
	["NetworkBlacklist"] = true,
	["InventoryID"] = true,
	["EntityID"] = true,
	["Weapon"] = true
}

ITEM.Weapon 			= nil

ITEM.Variants			= {
	Default = {
		WeaponClass = "",
		Model = "models/weapons/w_mach_m249para.mdl",
		Skin = 0,
		Bodygroups = {},
		Title = nil,
		Cost = 0,
		Refund = 0,
		Description = "",
		Width = 2,
		Height = 2
	}
}

ITEM.AmmoTypes 			= {
	["ammo_9x19mm"] = true,
	["ammo_556x45mm"] = true
}

ITEM.TriggersNPCs 		= true

function ITEM:OnEquip(ply, slot, loading)
	if SERVER and not loading then
		self:GiveWeapon(ply)

		ply:HandleNPCRelationships()
	end
end

function ITEM:OnUnequip(ply, slot, unloading)
	if SERVER then
		if self.AmmoSave ~= nil then
			self:SaveAmmo()
		end

		if not unloading then
			self:TakeWeapon(ply)

			ply:HandleNPCRelationships()
		end
	end
end

function ITEM:GetWeapon()
	if not self.Weapon then
		return
	end

	return Entity(self.Weapon)
end

function ITEM:GetContextOptions(ply)
	local tab = {}
	local types = table.Count(self.AmmoTypes)

	if types > 1 then
		for type,v in SortedPairs(self.AmmoTypes) do
			table.insert(tab, {
				Name = string.format("Use Ammo: %s", GAMEMODE:GetAmmo(class.Get(type).AmmoClass).Name),
				Callback = function()
					self.AmmoSelect = type
				end
			})
		end
	end

	if ply:IsAdmin() and ply:IsInEditMode() then
		for k,v in SortedPairs(self.Variants) do
			table.insert(tab, {
				Name = string.format("Admin Edit Mode: Set Variant: %s", v.Title),
				Callback = function()
					if not (ply:IsAdmin() and ply:IsInEditMode()) then
						return
					end

					local equipped = self:TakeWeapon(ply)
					self.Selected = k

					self.Width = self.Variants[self.Selected].Width
					self.Height = self.Variants[self.Selected].Height

					if equipped then
						self:GiveWeapon(ply)
						ply:SelectWeapon(self.Variants[self.Selected].WeaponClass)
					end
				end
			})
		end
	end

	for _, v in pairs(self:ParentCall("GetContextOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

function ITEM:GetOptions(ply)
	local tab =  self:GetContextOptions(ply)

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

function ITEM:GetAmmo()
	local type = self.AmmoSelect

	if type ~= nil then
		return type
	end

	for type,v in SortedPairs(self.AmmoTypes) do
		return type
	end
end

function ITEM:GetSavedAmmo()
	return self.AmmoSave
end

function ITEM:GetWeaponClass()
	if self.Selected then
		return self.Variants[self.Selected].WeaponClass
	end

	return self.Variants.Default.WeaponClass
end

function ITEM:GetModel()
	if self.Selected then
		return self.Variants[self.Selected].Model
	end

	return self.Variants.Default.Model
end

function ITEM:GetSkin()
	if self.Selected then
		return self.Variants[self.Selected].Skin
	end

	return self.Variants.Default.Skin
end

function ITEM:GetBodygroups()
	if self.Selected then
		return self.Variants[self.Selected].Bodygroups
	end

	return self.Variants.Default.Bodygroups
end

function ITEM:GetName()
	if self.Selected then
		local title = self.Variants[self.Selected].Title

		if title == "Default" then
			return self.Name
		end

		return string.format("%s \"%s\"", self.Name, title)
	end

	return self.Name
end

if SERVER then
	function ITEM:SetSavedAmmo(tab)
		self.AmmoSave = tab
	end

	function ITEM:OnSpawn(ply)
		self:GiveWeapon(ply, true)
	end

	function ITEM:OnDeath(ply)
		self.Weapon = nil
	end

	function ITEM:GiveWeapon(ply, load)
		local weapon = ply:Give(self:GetWeaponClass())

		if weapon.SetItemID then
			weapon:SetItemID(self.NetworkID)
		end

		self.Weapon = weapon:EntIndex()
	end

	function ITEM:TakeWeapon(ply)
		if self.Weapon == nil then
			return false
		end

		ply:StripWeapon(self:GetWeaponClass())

		self.Weapon = nil

		return true
	end

	function ITEM:SaveAmmo()
		local weapon = self:GetWeapon()

		if IsValid(weapon) and weapon.SaveAmmo then
			weapon:SaveAmmo()
		end
	end
end

return ITEM