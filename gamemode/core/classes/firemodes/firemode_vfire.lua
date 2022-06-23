FIREMODE = class.Create("firemode_semi")

FIREMODE.Name 		= "Flamethrower"

FIREMODE.Automatic 	= true

function FIREMODE:CanReload()
	return false
end

function FIREMODE:Fire()
	local ply = self.Weapon.Owner
	local delay = self:GetDelay()

	ply:SetAnimation(PLAYER_ATTACK1)
    
    GAMEMODE:GetAmmo("vfire"):OnFired(ply, self.Weapon, self.Weapon.CurrentCone)

    self.Weapon:DoRecoil(self.Weapon.Recoil)

	if CLIENT and IsFirstTimePredicted() then
		self.Weapon:DoVMRecoil(self.Weapon.Recoil)
    end

    self.Weapon:SetNextPrimaryFire(CurTime() + delay)
    
    if SERVER then
        if ply:KeyPressed(IN_ATTACK) or not self.SoundClip then
            self.SoundClip = CreateSound(ply, Sound("tnb/weapons/common/flamer/fire.wav"))
        end

        if self.SoundClip then
            self.SoundClip:PlayEx(1, math.random(80, 110))
        end
    end
end

function FIREMODE:CloseSound()
    self.Weapon.Owner:EmitSound("tnb/weapons/common/flamer/close.wav", 80, math.random(90, 110))
end

function FIREMODE:OnDeath()
    if self.SoundClip then
        self.SoundClip:Stop()
        self.SoundClip = nil
        self:CloseSound()
    end
end

function FIREMODE:Think()
    if CLIENT then
        return
    end

    local ply = self.Weapon.Owner

    if not self:CanFire() or ply:KeyReleased(IN_ATTACK) or (not ply:KeyDown(IN_ATTACK) and self.SoundClip) then
        
        if self.SoundClip then
            self.SoundClip:Stop()
            self.SoundClip = nil
            self:CloseSound()
        end
    end
end

function FIREMODE:CanFire()
	if self.Weapon:ShouldLower() then
		return false
    end

    if not self.Weapon.Owner:Alive() then
        return false
    end

	return self.Weapon.Owner:HasItem("ammo_flamethrower")
end

if CLIENT then
	function FIREMODE:GetFiremodeDisplay()
		local firemode = self.Name
		local ammo = self.Weapon.Owner:HasItem("ammo_flamethrower") and "Loaded" or "Empty"

		local setting = GAMEMODE:GetSetting("hud_firestyle")
		local str

		if setting == FIRETYPE_MODE then
			str = string.format("<font=eternity.labelgiant><ol>%s", firemode)
		elseif setting == FIRETYPE_AMMO then
			str = string.format("<font=eternity.labelgiant><ol>%s", ammo)
		elseif setting == FIRETYPE_BOTH then
			str = string.format("<font=eternity.labelgiant><ol>%s, %s", firemode, ammo)
		end

		return str
	end
end

return FIREMODE