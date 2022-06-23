AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

game.AddParticles("particles/vortigaunt_fx.pcf")
PrecacheParticleSystem("vortigaunt_charge_token")
PrecacheParticleSystem("vortigaunt_beam")

SWEP.Base 				= "eternity_melee_base"
SWEP.InfoText		    = "Left click while holstered to knock on a door\nLeft click while unholstered to swing at an enemy\nRight click while unholstered to attack with lightening\nReload when facing a door to try and ram it"

SWEP.PrintName 			= "Vortigaunt"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/c_arms_citizen.mdl")
SWEP.VMSubMaterials     = "null"
SWEP.WorldModel 		= Model("models/weapons/c_arms.mdl")

SWEP.HoldType 			= "fist"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Delay 				= 1

SWEP.Damage 			= 5
SWEP.CDamage            = 8

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

function SWEP:PlayVCD(seq)
	local ply = self.Owner

	ply:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ply:LookupSequence(seq), 0, true)

	if SERVER then
		netstream.Send("PlayVCD", {
			Ply = ply,
			Seq = seq
		})
	end
end

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
    
    self:PlayVCD(table.Random({
        "meleehigh1",
        "meleehigh2",
        "meleehigh3",
        "meleelow"
    }))

    BaseClass.PrimaryAttack(self)
end

function SWEP:SecondaryAttack()
	if self:GetHolstered() then
		return
	end

	if not self.Owner:IsOnGround() then
		return
	end

	if self.Owner:SpeciesState() ~= "free" then
		return
	end

	self:SetNextPrimaryFire(CurTime() + 1.5)
	self:SetNextSecondaryFire(CurTime() + 1.5)

	--self.Owner:Freeze(true)

	--timer.Simple(1.5, function()
	--	self.Owner:Freeze(false)
	--end)

	self:PlayVCD("g_zapattack1")

	self.Owner:ViewPunch(Angle( -15, 0, 0 ))

	self:EmitSound("NPC_Vortigaunt.ZapPowerup")

	if CLIENT then
		ParticleEffectAttach("vortigaunt_charge_token", PATTACH_POINT_FOLLOW, self.Owner, 3)
		ParticleEffectAttach("vortigaunt_charge_token", PATTACH_POINT_FOLLOW, self.Owner, 4)
	end

	timer.Simple(0.3, function()
		if not IsValid(self) or not IsValid(self.Owner) or not self.Owner:GetActiveWeapon() or not self.Owner:GetActiveWeapon() == self then 
			return 
		end
		
		self:StopSound("NPC_Vortigaunt.ZapPowerup")
		self.Owner:StopParticles()

		if SERVER then
			local tr = self:GetHandTrace(1024)

			util.ParticleTracerEx("vortigaunt_beam", tr.StartPos, tr.HitPos + tr.Normal * -32, false, self.Owner:EntIndex(), 2)
			self:EmitSound("npc/vort/attack_shoot.wav", 80, math.random( 130, 160 ))

			local enttab = ents.FindInSphere(tr.HitPos, 64)

			for _, v in pairs( enttab ) do
				if v == self.Owner then 
					continue 
				end
				
				local dmg = DamageInfo()
				dmg:SetAttacker(self.Owner)
				dmg:SetDamage(75)
				dmg:SetDamageForce(tr.Normal * 30000)
				dmg:SetDamagePosition(tr.HitPos)
				dmg:SetDamageType(DMG_SHOCK)
				dmg:SetInflictor(self)
				
				if v.DispatchTraceAttack then
					v:DispatchTraceAttack(dmg, tr)
				end
				
				if v:IsDoor() then
					if v:DoorType() == DOOR_SPECIAL or v:DoorType() == DOOR_ATALAB then
						v:Fire("Open")
						v:EmitSound("AlyxEMP.Discharge")
					end
					
					if v:DoorType() == DOOR_PUBLIC and v:CombineLock() then
						v:SetDoorLocked(false)
						v:EmitSound("AlyxEMP.Discharge")
					end
				end
				
				if v:GetClass() == "func_button" then
					v:Fire("Use")
					v:EmitSound("AlyxEMP.Discharge")
				end
			end

		end

		self.Owner:ViewPunch(Angle( 20, 0, 0 ))
	end)
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

	if ent:CombineLock() then
		return 0
    end
    
    local base = 10 + (self.Owner:ArmorLevel() * 10)

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

	if ent:DoorType() == DOOR_SPECIAL or ent:DoorType() == DOOR_IGNORED or ent:DoorType() == DOOR_ATALAB then
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