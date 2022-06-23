AddCSLuaFile()
DEFINE_BASECLASS("ent_base")

ENT.Base 		= "ent_base"

ENT.Model 		= Model("models/tnb/weapons/w_bottle.mdl")

ENT.SmokeColor 	= Vector(25, 25, 25)

function ENT:SetTimer(delay)
	self.Detonate = CurTime() + delay

	self:NextThink(CurTime())
end

function ENT:Initialize()
	self:SetModel(self.Model)
    self:SetBodygroup(1, 1)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		self:SetCollisionGroup(COLLISION_GROUP_WEAPON)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end
	end
end

function ENT:PhysicsCollide(data, collider)
	self:EmitSound("physics/glass/glass_bottle_break"..math.random(1, 2)..".wav")
	self:EmitSound("ambient/fire/ignite.wav")

    CreateVFireBall(30, 30, self:GetPos() + Vector(5, 0, 5), Vector(5, 0, 5))
    CreateVFireBall(30, 30, self:GetPos() + Vector(-5, 0, 5), Vector(-5, 0, 5))

    CreateVFireBall(30, 30, self:GetPos() + Vector(5, 5, 5), Vector(5, 5, 5))
    CreateVFireBall(30, 30, self:GetPos() + Vector(-5, -5, 5), Vector(-5, -5, 5))

    CreateVFireBall(30, 30, self:GetPos() + Vector(0, 5, 5), Vector(0, 5, 5))
    CreateVFireBall(30, 30, self:GetPos() + Vector(0, -5, 5), Vector(0, -5, 5))

    CreateVFireBall(30, 30, self:GetPos() + Vector(0, 5, 5), Vector(0, 5, 5))
    CreateVFireBall(30, 30, self:GetPos() + Vector(0, -5, 5), Vector(0, -5, 5))

    SafeRemoveEntity(self)
end

function ENT:Explode()
	local ed = EffectData()

	ed:SetOrigin(self:WorldSpaceCenter())
	ed:SetStart(self.SmokeColor)
	ed:SetEntity(self)

    util.Effect("eternity_smokegrenade", ed)
    util.Effect("eternity_smokegrenade", ed)
end

function ENT:Think()
	if CLIENT then
		return
	end

	if self.Detonate and self.Detonate <= CurTime() then
		self:Explode()
		self:NextThink(math.huge)

		return true
	end

	self:NextThink(CurTime() + 0.1)

	return true
end