AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M249 Light Machine Gun"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_inss_m249.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_m249.mdl")
SWEP.BodyGroups			= {[1] = 0}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 200
SWEP.Delay 				= 0.075

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 2.2

SWEP.FireSound 			= Sound("weapons/m249/m249_fp.wav")
SWEP.DrySound 			= Sound("weapons/m249/m249_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.75, 0, 0),
	pos = Vector(-5.5075, -3.5, 1.89)
}


SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -2)
}


SWEP.Animations = {
	fire = {"base_fire_1", "base_fire_2", "base_fire_3"},
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw"
}
