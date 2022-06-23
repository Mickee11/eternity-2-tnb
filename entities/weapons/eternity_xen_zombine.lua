AddCSLuaFile()
DEFINE_BASECLASS("eternity_base")

SWEP.RenderGroup 		= RENDERGROUP_OPAQUE

SWEP.Base 				= "eternity_base"

SWEP.PrintName 			= "Zombine Grenade"
SWEP.Author 			= "TankNut"

SWEP.DrawCrosshair 		= false

SWEP.ViewModel 			= Model("models/weapons/c_grenade.mdl")
SWEP.WorldModel 		= Model("models/weapons/w_npcnade.mdl")

SWEP.Damage 			= 175
SWEP.Radius 			= 250

SWEP.DefaultOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, 0)
}

SWEP.LoweredOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, 0)
}

function SWEP:Initialize()
	BaseClass.Initialize(self)

	self:SetNextBlip(-1)
	self:SetDetonate(-1)
end

function SWEP:SetupDataTables()
	self:NetworkVar("Bool", 0, "Holstered")

	self:NetworkVar("Float", 1, "NextBlip")
	self:NetworkVar("Float", 2, "Detonate")
end

function SWEP:Deploy()
	BaseClass.Deploy(self)

	self:PlayAnimation("draw", -1, 1, true, self.VM, true)
end

function SWEP:Holster(next)
	if self:GetDetonate() != -1 then
		return false
	end

	return BaseClass.Holster(self, next)
end

function SWEP:CanFire()
	return true
end

function SWEP:ShouldLower()
	return self:GetDetonate() == -1
end

function SWEP:PrimaryAttack()
	if not self:CanFire() then
		return
	end

	if SERVER then
		local main = ents.Create("env_sprite")

		main:SetPos(self:GetPos())
		main:SetParent(self, 1)
		main:SetKeyValue("model", "sprites/redglow1.vmt")
		main:SetKeyValue("scale", 0.2)
		main:SetKeyValue("GlowProxySize", 4)
		main:SetKeyValue("rendermode", 5)
		main:SetKeyValue("renderamt", 200)
		main:Spawn()
		main:Activate()

		trail = ents.Create("env_spritetrail")

		trail:SetPos(self:GetPos())
		trail:SetParent(self, 1)
		trail:SetKeyValue("spritename", "sprites/bluelaser1.vmt")
		trail:SetKeyValue("startwidth", 8)
		trail:SetKeyValue("endwidth", 1)
		trail:SetKeyValue("lifetime", 0.5)
		trail:SetKeyValue("rendermode", 5)
		trail:SetKeyValue("rendercolor", "255 0 0")
		trail:Spawn()
		trail:Activate()

		self:DeleteOnRemove(main)
		self:DeleteOnRemove(trail)
	end

	self:SetNextBlip(CurTime())
	self:SetDetonate(CurTime() + 3)

	self:PlayAnimation("draw", 1, 0, true, self.VM, true)

	self:SetNextPrimaryFire(math.huge)
	self:SetNextSecondaryFire(math.huge)
end

function SWEP:Think()
	local beep = self:GetNextBlip()
	local detonate = self:GetDetonate()

	if beep != -1 and beep <= CurTime() then
		self:EmitSound("Grenade.Blip")

		local time = 1

		if detonate - CurTime() <= 1.5 then
			time = 0.3
		end

		self:SetNextBlip(CurTime() + time)
	end

	if detonate != -1 and detonate <= CurTime() then
		self:SetDetonate(-1)
		self:SetNextBlip(-1)

		if SERVER then
			self:Explode()
		end
	end
end

if SERVER then
	function SWEP:Explode()
		local ply = self:GetOwner()
		local pos = ply:WorldSpaceCenter()

		util.ScreenShake(pos, 25, 150, 1, self.Radius)

		local explo = ents.Create("env_explosion")
		explo:SetOwner(ply)
		explo:SetPos(pos)
		explo:SetKeyValue("iMagnitude", self.Damage)
		explo:SetKeyValue("iRadiusOverride", self.Radius)
		explo:Spawn()
		explo:Activate()
		explo:Fire("Explode")
	end
end

function SWEP:ToggleHolster()
end

if CLIENT then
	function SWEP:DrawWorldModel()
		local ply = self:GetOwner()

		if IsValid(ply) then
			local att = ply:GetAttachment(8)

			self:SetRenderOrigin(att.Pos)
			self:SetRenderAngles(att.Ang)
		end

		self:SetupBones()
		self:DrawModel()
	end
end
