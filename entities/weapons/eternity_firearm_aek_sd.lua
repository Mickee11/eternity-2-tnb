AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "AEK-971 \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_aek.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_aek.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 45
SWEP.Delay 				= 0.12

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 0.9

SWEP.FireSound 			= Sound("eternity.weapon_aek.sd")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.LimitTracers		= true

SWEP.AimOffset = {
	ang = Angle(2, 0, -2),
	pos = Vector(-4.88, -7.5, -0.59)
}

SWEP.Animations = {
	fire = {"fire1", "fire2"},
	fire_last = {"fire1", "fire2"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
