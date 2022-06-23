AMMO = class.Create("base_gameammo")

AMMO.CDamage = 25
AMMO.Damage = 0

function AMMO:Callback(attacker, tr, dmginfo)
	if not SERVER then
		return
	end

	local ent = tr.Entity
	if not IsValid(ent) then
		return
	end

	if ent:IsPlayer() then
		ent:TakeCDamage(self.CDamage)
	elseif IsValid(ent:FakePlayer()) then
		ent:FakePlayer():TakeCDamage(self.CDamage)
	elseif ent:IsVehicle() and IsValid(ent:GetDriver()) then
		ent:GetDriver():TakeCDamage(self.CDamage)
	end
end

function AMMO:OnFired(ply, weapon, cone)
	math.randomseed(ply:GetCurrentCommand():CommandNumber())

	local aimcone = Angle(math.Rand(-cone, cone), math.Rand(-cone, cone), 0)
	local bullet = {}

	bullet.Num 			= self.Amount
	bullet.Src 			= ply:GetShootPos()
	bullet.Dir 			= (ply:GetAimVector():Angle() + ply:GetViewPunchAngles() + aimcone * 25):Forward()
	bullet.Spread 		= Vector(self.Spread, self.Spread, 0)
	bullet.Damage 		= self.Damage
	bullet.Tracer 		= 1
	bullet.TracerName 	= self.Tracer
	bullet.Force 		= self.Damage * 0.3
	bullet.AmmoType 	= ""

	bullet.Callback = function(attacker, tr, dmginfo)
		self:Callback(attacker, tr, dmginfo)
	end

	weapon:EmitSound(weapon.FireSound)

	ply:FireBullets(bullet)
end

return AMMO
