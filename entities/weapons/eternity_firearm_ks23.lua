AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "KS-23"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_l4d2/c_ks23.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ks23.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 4
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_l4d2/ks23/shotgun_fire_1.wav")
SWEP.DrySound 			= Sound("weapons/remington_870/870_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-3.7, -1, 2.75)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, -2, 0)
}

SWEP.Animations = {
	draw = "deploy",
	fire = "fire",
	reload = "reload",
	reloadinsert = "reload_loop",
	reloadfinish = "reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
