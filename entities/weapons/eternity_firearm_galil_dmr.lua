AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Galil ARM \"DMR\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_galil.mdl")
SWEP.VMBodyGroups		= {[1] = 3}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_galil.mdl")
SWEP.WMBodyGroups			= {[1] = 3}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 25
SWEP.Delay 				= 0.125

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.925

SWEP.FireSound 			= Sound("eternity.weapon_galil")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {4}
}

SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-6.375, -7.5, 0.575)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	fire_last = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
