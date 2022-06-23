AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Shank"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_shank.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_shank.mdl")

SWEP.HoldType 			= "knife"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Delay 				= 0.5

SWEP.LoweredOffset 	= {
	ang = Angle(5, 0, 0),
	pos = Vector(0, 0, -5)
}

SWEP.DefaultOffset 	= {
	ang = Angle(15, 0, 0),
	pos = Vector(0, 0, -5)
}

SWEP.Animations = {
	idle = "idle",
	hit = {"hitcenter1", "hitcenter2", "hitcenter3"},
	miss = {"misscenter1", "misscenter2"}
}

function SWEP:Deploy()
	BaseClass.Deploy(self)
end

function SWEP:GetDamage()
	return 10, DMG_SLASH
end

function SWEP:GetCDamage()
	return 0
end

function SWEP:OnHit()
	self:EmitSound("eternity.knife_hit")
end

function SWEP:OnMiss()
    self:EmitSound("eternity.knife_slash")
end
