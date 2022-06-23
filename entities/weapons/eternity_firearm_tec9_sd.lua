AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Intratec TEC-9 \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_tec9.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_tec9.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 32
SWEP.Delay 				= 0.135

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("eternity.weapon_tec9.sd")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.LimitTracers		= true

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-5.4, -7.5, 1.875)
}

SWEP.Animations = {
	fire = "fire",
	fire_last = "fireempty",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
