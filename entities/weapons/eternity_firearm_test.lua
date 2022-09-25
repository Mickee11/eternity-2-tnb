AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Test"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/gs3/test/c_dualpistol.mdl")

SWEP.WorldModel 		= Model("models/gs3/test/w_pistoldual.mdl")

SWEP.HoldType 			= "duel"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 40
SWEP.Delay 				= 0.165

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 2.1

SWEP.FireSound 			= Sound("weapons/tfa_csgo/elite/elite-1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_inss/m1911/m1911_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.45, 2, 1.05)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, 0)
}


SWEP.Animations = {
	idle = "idle",
	fire = {"shoot_left1", "shoot_right1"},
	reload = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end