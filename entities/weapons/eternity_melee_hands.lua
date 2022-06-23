AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"
SWEP.InfoText		    = "Left click while holstered to knock on a door\nLeft click while unholstered to swing at an enemy\nReload when facing a door to try and ram it"


SWEP.PrintName 			= "Hands"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/c_arms_citizen.mdl")
SWEP.VMSubMaterials     = "null"
SWEP.WorldModel 		= Model("models/weapons/c_arms.mdl")

SWEP.HoldType 			= "fist"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Delay 				= 0.75

SWEP.Damage 			= 2
SWEP.CDamage            = 4

SWEP.Animations = {
	idle = {"fists_idle_01", "fists_idle_02"},
	hit = {"fists_left", "fists_right", "fists_uppercut"},
	miss = {"fists_left", "fists_right", "fists_uppercut"}
}

SWEP.LoweredOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, -4)
}

SWEP.DefaultOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, -4)
}

function SWEP:ToggleHolster()
	if CurTime() < self:GetNextModeSwitch() then
		return
	end

	local bool = not self:GetHolstered()
	local duration = 1

	self:SetHolstered(bool)

	self:SetNextModeSwitch(CurTime() + 0.5)
    self:SetNextPrimaryFire(CurTime() + 0.5)
    
    if bool then
        self:PlayAnimation("fists_holster", 1, 0, true, self.VM, true)
    else
        self:PlayAnimation("fists_draw", 1, 0, true, self.VM, true)
    end
end

function SWEP:Deploy()
    self:SetHolstered(true)
    self:SetHoldType(self.HoldTypeLowered)

	if CLIENT then
		self.BlendPos, self.BlendAng = Vector(self.LoweredOffset.pos), Angle(self.LoweredOffset.ang)
	end

	self:PlayAnimation("fists_holster")
end

function SWEP:Reload()
	self.NextReload = self.NextReload or CurTime()

	if self.NextReload > CurTime() then
		return
	end

	self.NextReload = CurTime() + 2
	self:Ram()
end

function SWEP:PrimaryAttack()
	if self:GetHolstered() then
        self:Knock()
        
        return
    end
    
    BaseClass.PrimaryAttack(self)
end

function SWEP:GetHandTrace(range)
	local ply = self.Owner
	local eye = ply:EyePos()

	return util.TraceLine({
		start = eye,
		endpos = eye + (ply:GetAimVector() * (range or 50)),
		filter = ply
	})
end

function SWEP:Knock()
	local ent = self:GetHandTrace().Entity

	if not IsValid(ent) or not ent:IsDoor() then
		return
	end

	if SERVER then
		sound.Play("physics/wood/wood_crate_impact_hard2.wav", ent:WorldSpaceCenter(), 70, math.random(95, 105), 1)
	end

	self:SetNextPrimaryFire(CurTime() + 0.1)
end

function SWEP:GetRamChance(ent)
	if not ent:DoorLocked() then
		return 100
	end
    
	if self.Owner:GetMaxArmor() == 0 then
		return 25
	end

	local multiplier = self.Owner:Armor() / self.Owner:GetMaxArmor()

	local base = 65 * multiplier

    if not self.Owner:GetHolstered() then
        base = base * 1.5
    end

	return base
end

function SWEP:Ram()
	local ply = self.Owner
	local tr = self:GetHandTrace(130)
	local ent = tr.Entity

	if ply:GetVelocity():Length() > 50 or ply:Crouching() or not ply:OnGround() or ply:Restrained() then
		return
	end

	if not IsValid(ent) or not ent:IsDoor() then
		return
	end

	if tr.Fraction < 0.2 then
		return
	end

	local classname = ent:GetClass()

	if classname != "prop_door_rotating" and classname != "func_door_rotating" then
		return
	end

	if ent:DoorType() == DOOR_SPECIAL or ent:DoorType() == DOOR_IGNORED then
		return
	end

	ply:SetVelocity(tr.Normal * 1000)
	ply:ViewPunch(Angle(-10, 0, 0))

	if SERVER then
		ply:TakeCDamage(8)

		ent:EmitSound(string.format("physics/wood/wood_crate_impact_hard%s.wav", table.Random({"1", "4", "5"})))

		ent = ent:GetMainDoor()

		local chance = math.Clamp(ent:RamChance() + self:GetRamChance(ent), 0, 100)

		if chance < math.random(1, 100) then
			ent:SetRamChance(chance)

			return
		end

		ent:RamDoor(ply)
	end
end