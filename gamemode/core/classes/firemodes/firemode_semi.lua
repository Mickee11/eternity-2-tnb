FIREMODE = class.Create()

FIREMODE.Name 			= "Semi-Automatic"

FIREMODE.Automatic 		= false

-- false reverts back to the weapon
FIREMODE.ClipSize 		= false

FIREMODE.Weapon = nil

function FIREMODE:OnCreated(weapon)
	self.Weapon = weapon
end

function FIREMODE:Get(var)
	return self[var] or self.Weapon[var]
end

function FIREMODE:GetAmmoItem()
	return self.Weapon:GetItem():GetAmmo()
end

function FIREMODE:GetAmmo()
	local ammo = class.Get(self.Weapon:GetAmmoType())

	if ammo == nil then
		return nil
	end

	return GAMEMODE:GetAmmo(ammo.AmmoClass)
end

function FIREMODE:SwitchTo()
	self.Weapon.Primary.ClipSize = self:Get("ClipSize")

	if self.Weapon:Clip1() == 0 then
		self.Weapon.Primary.Automatic = false
	else
		self.Weapon.Primary.Automatic = self.Automatic
	end
end

function FIREMODE:SwitchFrom()
end

function FIREMODE:CanSwitch()
	return not self.Weapon:IsReloading()
end

function FIREMODE:CanFire(thinking)
	if self.Weapon:ShouldLower() then
		return false
	end

	if (self.Weapon:GetAmmoType() == "") or (self.Weapon.Primary.ClipSize > 0 and self.Weapon:Clip1() <= 0) then
		if SERVER and (not thinking or (self.Weapon:GetNextPrimaryFire() <= CurTime() and self.Weapon.Owner:KeyDown(IN_ATTACK) and self.Weapon.Primary.Automatic)) then
			self.Weapon.Owner:EmitSound(self.Weapon.DrySound)
		end

		if not thinking or self.Weapon:GetNextPrimaryFire() <= CurTime() then
			self.Weapon.Primary.Automatic = false
		end
		
		return false
	end

	return true
end

function FIREMODE:GetDelay()
	return self:Get("Delay")
end

function FIREMODE:OnDeath()
end

function FIREMODE:Fire()
	local ply = self.Weapon.Owner
	local delay = self:GetDelay()

	ply:SetAnimation(PLAYER_ATTACK1)
	self.Weapon:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	local animated = self.Weapon.Animated

	if self.Weapon:AimingDownSights() then
		animated = self.Weapon.AnimatedADS
	end

	local animation = "fire"

	if self.Weapon:Clip1() <= 1 and self.Weapon.Animations.fire_last then
		animation = "fire_last"
	end

	if delay == -1 then
		delay = self.Weapon:PlayAnimation(animation)
	elseif animated then
		self.Weapon:PlayAnimation(animation)
	else
		self.Weapon:PlayAnimation(animation, 1, 1)
	end

	self:GetAmmo():OnFired(ply, self.Weapon, self.Weapon.CurrentCone)

	self.Weapon:DoRecoil(self.Weapon.Recoil)

	if CLIENT and IsFirstTimePredicted() then
		self.Weapon:DoVMRecoil(self.Weapon.Recoil)
	end

	if self.Weapon.PumpAction and self.Weapon:Clip1() > 1 then
		self.Weapon:SetNeedPump(true)
	end

	self.Weapon:TakePrimaryAmmo(1)
	self.Weapon:SetNextPrimaryFire(CurTime() + delay)

	if SERVER then
		self.Weapon:QueueSave()
	end
end

function FIREMODE:CanReload()
	local item = self:GetAmmoItem()

	if not self.Weapon.Owner:HasItem(item, 1) then
		return false
	end

	if self.Weapon:ShouldLower() then
		return false
	end

	if self.Weapon:IsReloading() then
		return false
	end

	if self.Weapon:GetNextPrimaryFire() > CurTime() then
		return false
	end

	if self.Weapon:Clip1() >= self.Weapon.Primary.ClipSize and self.Weapon:GetAmmoType() == item then
		return false
	end

	return true
end

function FIREMODE:Reload()
	local animation = "reload"
	local act = ACT_VM_RELOAD

	if self.Weapon:Clip1() == 0 and self.Weapon.Animations.reload_empty then
		animation = self.Weapon.Animations.reload_empty
	end

	if CLIENT then
		if self.Weapon.ReloadSound then
			self.Weapon.Owner:EmitSound(self.Weapon.ReloadSound, SNDLVL_IDLE, 100, 0.4, CHAN_WEAPON)
		end
	end

	self.Weapon.Owner:SetAnimation(PLAYER_RELOAD)
	self.Weapon:SendWeaponAnim(act)

	local duration = self.Weapon:PlayAnimation(animation)

	if self.Weapon.PumpAction and self.Weapon:Clip1() == 0 then
		self.Weapon:SetNeedPump(true)
	end

	if self.Weapon.ShotgunReload then
		self.Weapon:SetFirstReload(true)
	end

	self.Weapon:SetFinishReload(CurTime() + duration)
	self.Weapon:SetNextPrimaryFire(CurTime() + duration)
end

function FIREMODE:Think()
	if self.Weapon:IsReloading() and self.Weapon:GetFinishReload() <= CurTime() then
		self:HandleReload()
	end

	if self.Weapon:GetNextPrimaryFire() < CurTime() and not self.Weapon:IsReloading() and self.Weapon:GetNeedPump() then
		self.Weapon:SetNeedPump(false)
		self.Weapon:SendWeaponAnim(ACT_SHOTGUN_PUMP)

		local duration = self.Weapon:PlayAnimation("pump")

		self.Weapon:SetNextPrimaryFire(CurTime() + duration)
	end

	if self.Weapon:Clip1() > self.Weapon.ClipSize then
		local ammotype = self.Weapon:GetAmmoType()

		if SERVER and ammotype then
			coroutine.WrapFunc(function()
				self.Weapon.Owner:GiveItem(ammotype, self.Weapon:Clip1() - self.Weapon.ClipSize)
			end)

			self.Weapon:SetClip1(self.Weapon.ClipSize)
		end
	end
end

function FIREMODE:HandleReload()
	self.Weapon:SetFinishReload(0)
	local item = self:GetAmmoItem()

	if not self.Weapon.Owner:HasItem(item, 1) then
		return
	end

	local amt = 0
	local ammotype = self.Weapon:GetAmmoType()
	local clip = self.Weapon:Clip1()

	if ammotype ~= item then
		if SERVER and clip > 0 and ammotype != "" then
			coroutine.WrapFunc(function()
				self.Weapon.Owner:GiveItem(ammotype, clip)
			end)
		end

		self.Weapon:SetClip1(0)
		amt = self.Weapon.Primary.ClipSize
	else
		amt = self.Weapon.Primary.ClipSize - clip
	end

	if self.Weapon.ShotgunReload then
		if self.Weapon:GetFirstReload() then
			self.Weapon:SetFirstReload(false)

			amt = 0
		else
			amt = 1
		end
	end

	local ammocount

	if self.Weapon.Owner:InfiniteAmmo() then
		ammocount = self.Weapon.ClipSize
	else
		ammocount = self.Weapon.Owner:GetItemCount(item, true, false)
	end

	amt = math.Min(amt, ammocount)

	self.Weapon:SetClip1(math.Clamp(self.Weapon:Clip1() + amt, 0, self.Weapon.ClipSize))
	self.Weapon:SetAmmoType(item)

	if SERVER then
		if not self.Weapon.Owner:InfiniteAmmo() then
			self.Weapon.Owner:TakeItem(item, amt)
		end

		self.Weapon:QueueSave()
	end

	if self.Weapon.ShotgunReload then
		if self.Weapon:Clip1() >= self.Weapon.Primary.ClipSize or self.Weapon:GetAbortReload() or (ammocount <= 1 and amt > 0) then
			self.Weapon:SetAbortReload(false)
			self.Weapon:SendWeaponAnim(ACT_SHOTGUN_RELOAD_FINISH)

			local duration = self.Weapon:PlayAnimation("reloadfinish")

			self.Weapon:SetNextPrimaryFire(CurTime() + duration)
		else
			self.Weapon:SendWeaponAnim(ACT_VM_RELOAD)

			local duration

			if self.Weapon.Animations.reloadfirst and self.Weapon:Clip1() == 0 then
				duration = self.Weapon:PlayAnimation("reloadfirst")
			else
				duration = self.Weapon:PlayAnimation("reloadinsert")
			end

			self.Weapon:SetFinishReload(CurTime() + duration)
		end
	end

	self.Weapon.Primary.Automatic = self.Automatic
end

if CLIENT then
	function FIREMODE:GetAmmoDisplay()
		if self.Weapon.Primary.ClipSize == -1 then
			return
		end

		local ammotype = self.Weapon:GetAmmoType()
		
		if ammotype == "" then
			return
		end

		local setting = GAMEMODE:GetSetting("hud_ammostyle")
		local str

		if setting == AMMOTYPE_SINGLE then
			local backup = 0

			if ammotype != "" then
				local item = self.Weapon:GetItem()

				if item then
					backup = self.Weapon.Owner:GetItemCount(ammotype, true, false)
				end
			end

			str = string.format("<font=eternity.ammo><ol>%s/%s", self.Weapon:Clip1(), backup)
		elseif setting == AMMOTYPE_DOUBLE then
			str = string.format("<font=eternity.ammo><ol>%s/%s", self.Weapon:Clip1(), self.Weapon.Primary.ClipSize)
		end

		return str
	end

	function FIREMODE:GetFiremodeDisplay()
		local firemode = self.Name
		local ammotype = "Unloaded" 

		if self:GetAmmo() ~= nil then
			ammotype = self:GetAmmo().Name
		end

		local setting = GAMEMODE:GetSetting("hud_firestyle")
		local str

		if setting == FIRETYPE_MODE then
			str = string.format("<font=eternity.labelgiant><ol>%s", firemode)
		elseif setting == FIRETYPE_AMMO then
			str = string.format("<font=eternity.labelgiant><ol>%s", ammotype)
		elseif setting == FIRETYPE_BOTH then
			str = string.format("<font=eternity.labelgiant><ol>%s, %s", firemode, ammotype)
		end

		return str
	end
end

return FIREMODE
