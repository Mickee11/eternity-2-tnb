DEFINE_BASECLASS("eternity_xen_antlion")
AddCSLuaFile()

SWEP.Base 					= "eternity_xen_antlion"

SWEP.RenderGroup 			= RENDERGROUP_OPAQUE

SWEP.PrintName 				= "Antlion Worker"
SWEP.Author 				= "TankNut"

SWEP.InfoText		    	= "Left click to slash at your enemy\nRight click to jump to where you're aiming\nReload to spit acid"

SWEP.Damage 				= 60

function SWEP:CheckThrowTolerance(startPos, endPos, speed, tolerance) -- Thanks valve
	local ply = self:GetOwner()
	local gravity = -physenv.GetGravity().z

	local velocity = endPos - startPos

	local time = velocity:Length() / speed
	velocity = velocity * (1 / time)

	velocity.z = velocity.z + (gravity * time * 0.5)

	local apex = startPos + (endPos - startPos) * 0.5
	apex.z = apex.z + (0.5 * gravity * (time * 0.5) * (time * 0.5))

	local trace1 = util.TraceLine({
		start = startPos,
		endpos = apex,
		filter = ply,
		mask = MASK_SOLID,
	})

	if trace1.Fraction != 1 then
		return false
	end

	local trace2 = util.TraceLine({
		start = apex,
		endpos = endPos,
		filter = ply,
		mask = MASK_SOLID_BRUSHONLY,
	})

	if trace2.Fraction < 0.99 and tolerance > 0 then
		local near = (trace2.HitPos - endPos):LengthSqr()

		if near < (tolerance ^ 2) then
			return false
		end
	end

	return velocity
end

function SWEP:Reload()
	local ply = self:GetOwner()

	if self:GetInJump() or not ply:IsOnGround() then
		return
	end

	if self:GetAnimEnd() >= CurTime() then
		return
	end

	local mouthPos = ply:GetAttachment(ply:LookupAttachment("mouth")).Pos
	local endPos = ply:GetEyeTrace().HitPos

	if mouthPos:Distance(endPos) > 1600 then
		return
	end

	local speed = GetConVar("sk_antlion_worker_spit_speed"):GetFloat()
	local vector = self:CheckThrowTolerance(mouthPos, endPos, speed, 10 * 12)

	if not vector then
		vector = self:CheckThrowTolerance(mouthPos, endPos, speed * 1.5, 10 * 12)

		if not vector then
			return
		end
	end

	local anim = ply:LookupSequence("spit")

	if SERVER then
		self:SetAnim(anim)
		self:SetAnimEnd(CurTime() + ply:SequenceDuration(anim))

		ply:EmitSound("NPC_Antlion.PoisonShoot")
	end

	if SERVER then
		for i = 1, 6 do
			local ent = ents.Create("grenade_spit")
			ent:SetPos(mouthPos)
			ent:SetOwner(ply)
			ent:Spawn()
			ent:Activate()

			if i == 1 then
				ent:SetVelocity(vector)
			else
				ent:SetModel(math.random(0, 1) == 1 and "models/spitball_medium.mdl" or "models/spitball_small.mdl")
				ent:SetVelocity((vector:GetNormalized() + VectorRand() * 0.035) * vector:Length())
			end

			ent:SetLocalAngularVelocity(AngleRand())
		end
	end
end
