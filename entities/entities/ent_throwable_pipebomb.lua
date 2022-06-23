AddCSLuaFile()
DEFINE_BASECLASS("ent_base")

ENT.Base 	= "ent_base"

ENT.Model 	= Model("models/tnb/trpweapons/w_pipebomb.mdl")

ENT.Damage 	= 300
ENT.Radius 	= 250

function ENT:SetTimer(delay)
	self.Detonate = CurTime() + delay
	self.Beep = CurTime()

	self:NextThink(CurTime())
end

function ENT:Initialize()
	self:SetModel(self.Model)

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

function ENT:Explode()
	local pos = self:WorldSpaceCenter()

	util.ScreenShake(pos, 30, 175, 1, self.Radius)

	local explo = ents.Create("env_explosion")
	explo:SetOwner(self:GetOwner())
	explo:SetPos(pos)
	explo:SetKeyValue("iMagnitude", self.Damage)
	explo:SetKeyValue("iRadiusOverride", self.Radius)
	explo:Spawn()
	explo:Activate()
	explo:Fire("Explode")

	self:Remove()
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