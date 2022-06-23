AMMO = class.Create("gameammo_projectile")

AMMO.Name 		= "Fire"

AMMO.Offset 	= Vector(5, -5, -12)

function AMMO:OnFired(ply, weapon, cone)
	if SERVER then
		local pos = LocalToWorld(self.Offset, Angle(), ply:GetShootPos(), ply:EyeAngles())

		if not util.IsInWorld(pos) then
			pos = ply:GetShootPos()
		end

		local forwardBoost = math.Rand(20, 40)
		local frac = ply:GetEyeTrace().Fraction

		if frac < 0.001245 then
			forwardBoost = 1
		end

		pos = pos
		local vel = ply:EyeAngles():Forward() * 2500

        CreateVFireBall(10, 30, pos, vel, ply)
	end
end


return AMMO
