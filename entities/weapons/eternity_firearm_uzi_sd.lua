AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Uzi \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_uzi.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_uzi.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 40
SWEP.Delay 				= 0.0925

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.04 -- ADS spread

SWEP.Recoil 			= 1.1

SWEP.FireSound 			= Sound("eternity.weapon_uzi.sd")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.RecoilMult 		= 0

SWEP.LimitTracers		= true
SWEP.LimitTracerNum		= 6

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-5.35, -7.5, 1.1)
}

SWEP.Animations = {
	fire = "fireempty",
	fire_last = "fireempty",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
