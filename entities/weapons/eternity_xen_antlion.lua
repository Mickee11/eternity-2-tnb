AddCSLuaFile()

SWEP.RenderGroup 			= RENDERGROUP_OPAQUE

SWEP.PrintName 				= "Antlion"
SWEP.Author 				= "TankNut"

SWEP.InfoText		    	= "Left click to slash at your enemy\nRight click to jump to where you're aiming"

SWEP.DrawCrosshair 			= true

SWEP.ViewModel 				= ""
SWEP.WorldModel 			= ""

SWEP.UseHands 				= false

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= -1
SWEP.Primary.Automatic 		= true
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "none"

SWEP.Damage 				= 60

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "InJump")

	self:NetworkVar("Float", 0, "AnimEnd")

	self:NetworkVar("Int", 0, "Anim")

	self.SetupDone = true
end

function SWEP:Holster()
	if self:GetInJump() then
		return false
	end

	if self:GetAnimEnd() >= CurTime() then
		return false
	end

	return true
end

function SWEP:Think()
	local ply = self:GetOwner()

	if ply:IsOnGround() and self:GetInJump() then
		if SERVER then
			self:SetInJump(false)

			ply:StopSound("antlion_flight_loop")
			ply:EmitSound("antlion_flight_land")
		end

		ply:SetVelocity(-ply:GetVelocity())

		ply:SetBodygroup(1, 0)
	end
end

function SWEP:ShouldLockInput()
	return self:GetAnimEnd() >= CurTime()
end

function SWEP:PrimaryAttack()
	local ply = self:GetOwner()

	if self:GetInJump() or not ply:IsOnGround() then
		return
	end

	if self:GetAnimEnd() >= CurTime() then
		return
	end

	math.randomseed(CurTime())

	local anim = ply:LookupSequence("attack" .. math.random(6))

	if SERVER then
		self:SetAnim(anim)
		self:SetAnimEnd(CurTime() + ply:SequenceDuration(anim))

		ply:EmitSound("NPC_Antlion.MeleeAttackSingle")
	end

	local trace = util.TraceHull({
		start = ply:GetShootPos(),
		endpos = ply:GetShootPos() + ply:GetAimVector() * 100,
		filter = ply,
		mins = Vector(-20, -20, -20),
		maxs = Vector(20, 20, 20),
		mask = MASK_SHOT_HULL
	})

	local ent = trace.Entity

	if SERVER and IsValid(ent) then
		local info = DamageInfo()
		info:SetAttacker(ply)
		info:SetDamageForce(trace.Normal * 10000)
		info:SetDamagePosition(trace.HitPos)
		info:SetDamageType(bit.bor(DMG_CLUB, DMG_SLASH))
		info:SetInflictor(self)

		if ent:IsNPC() then
			info:SetDamage(ent:Health() * 6)
		else
			info:SetDamage(self.Damage)
		end

		ent:TakeDamageInfo(info)
	end
end

local function getJumpVelocity(startPos, endPos, minHeight, maxHorizontalVelocity) -- Thanks valve
	local gravity = -physenv.GetGravity().z
	local stepHeight = endPos.z - startPos.z

	local targetDir2D = endPos - startPos
	targetDir2D.z = 0

	local distance = endPos:Distance(startPos)

	local minHorzTime = distance / maxHorizontalVelocity
	local minHorzHeight = 0.5 * gravity * (minHorzTime * 0.5) * (minHorzTime * 0.5)

	minHeight = math.max(minHeight, minHorzHeight)
	minHeight = math.max(minHeight, stepHeight)

	local t0 = math.sqrt((2 * minHeight) / gravity)
	local t1 = math.sqrt((2 * math.abs(minHeight - stepHeight)) / gravity)

	local velHorz = distance / (t0 + t1)

	local jumpVel = targetDir2D:GetNormalized() * velHorz

	jumpVel.z = math.sqrt(2 * gravity * minHeight)

	return jumpVel
end

function SWEP:SecondaryAttack()
	local ply = self:GetOwner()

	if self:GetInJump() or not ply:IsOnGround() then
		return
	end

	if self:GetAnimEnd() >= CurTime() then
		return
	end

	local trace = ply:GetEyeTrace()

	local startPos = ply:GetPos()
	local endPos = trace.HitPos

	if startPos:Distance(endPos) > 1600 then
		return
	end

	local maxVel = math.min(800, startPos:Distance(endPos))

	ply:SetVelocity(getJumpVelocity(startPos, endPos, endPos.z - startPos.z + 100, maxVel))

	if SERVER then
		ply:EmitSound("antlion_flight_loop")
	end

	ply:SetBodygroup(1, 1)

	timer.Simple(0.01, function()
		self:SetInJump(true)
	end)
end


function SWEP:CalcMainActivity(ply, vel)
	if self:GetAnimEnd() >= CurTime() then
		if ply.lastSeqOverride != self:GetAnim() then
			ply:SetCycle(0)
		end

		ply.CalcSeqOverride = self:GetAnim()
	end

	if self:GetInJump() then
		ply.CalcSeqOverride = ply:LookupSequence("jump_glide")
	end

	ply.lastSeqOverride = ply.CalcSeqOverride
end
