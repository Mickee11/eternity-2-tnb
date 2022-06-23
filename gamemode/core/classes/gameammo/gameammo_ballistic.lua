AMMO = class.Create("base_gameammo")

AMMO.Damage 		= 0

AMMO.Amount 		= 1
AMMO.Spread 		= 0

AMMO.Tracer 		= "tracer"
AMMO.TracerCount 	= 1

function AMMO:Callback(attacker, tr, dmginfo)
	if SERVER then
		netstream.Send("ImpactSound", {HitPos = tr.HitPos})

		local ent = tr.Entity

		if not IsValid(ent) or not ent:IsDoor() then
			return
		end

		local classname = ent:GetClass()

		if classname != "prop_door_rotating" and classname != "func_door_rotating" then
			return
		end

		if ent:DoorType() == DOOR_SPECIAL or ent:DoorType() == DOOR_IGNORED or ent:DoorType() == DOOR_ATALAB then
			return
		end

		local pos = dmginfo:GetDamagePosition()

		if pos:DistToSqr(attacker:EyePos()) > 130^2 then
			return
		end

		local handle = ent:LookupBone("handle")

		if not handle or pos:DistToSqr(ent:GetBonePosition(handle)) > 8^2 then
			return
		end

		ent:RamDoor(attacker)
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
	bullet.Tracer 		= weapon.LimitTracers and weapon.LimitTracerNum or self.TracerCount
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
