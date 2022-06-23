AddCSLuaFile()

SWEP.PrintName 				= "Suppression Device"
SWEP.Author 				= "TankNut"

SWEP.InfoText		    	= "Left click: Accurate fire\nRight click: Inaccurate fire"

SWEP.RenderGroup 			= RENDERGROUP_OPAQUE

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= -1
SWEP.Primary.Automatic 		= false
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= true
SWEP.Secondary.Ammo 		= "none"

SWEP.UseHands 				= true

SWEP.ViewModel 				= Model("models/weapons/c_irifle.mdl")
SWEP.WorldModel 			= Model("models/weapons/w_irifle.mdl")

SWEP.Radius 				= 512

function SWEP:Deploy()
	self:SetHoldType("ar2")
end

function SWEP:PlaceMortar(pos)
	local ply = self:GetOwner()

	ply:SetAnimation(PLAYER_ATTACK1)
	self:SendWeaponAnim(ACT_VM_PRIMARYATTACK)

	if SERVER then
		local ent = ents.Create("ent_combinemortar")

		ent:SetOwner(ply)
		ent:SetPos(pos)
		ent:SetAngles(angle_zero)

		ent:Spawn()
		ent:Activate()
	end
end

function SWEP:PrimaryAttack()
	self:PlaceMortar(self:GetOwner():GetEyeTrace().HitPos)
end

function SWEP:SecondaryAttack()
	local ply = self:GetOwner()
	local pos = ply:GetEyeTrace().HitPos

	local r = self.Radius * math.sqrt(math.random())
	local theta = math.random() * 2 * math.pi

	local offset = Vector(r * math.cos(theta), r * math.sin(theta))

	local start = Vector(pos.x + offset.x, pos.y + offset.y, ply:GetPos().z)

	local tr = util.TraceLine({
		start = start,
		endpos = start - Vector(0, 0, 7500)
	})

	if tr.StartSolid or tr.Fraction == 1 then
		return
	end

	self:PlaceMortar(tr.HitPos)

	self:SetNextSecondaryFire(CurTime() + 0.75)
end
