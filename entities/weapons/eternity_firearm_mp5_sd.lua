AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Heckler & Koch MP5 \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mp5.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mp5.mdl")
SWEP.WMBodyGroups			= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.1

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 0.975

SWEP.FireSound 			= Sound("eternity.weapon_mp5.sd")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.LimitTracers		= true

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-5.35, -7.5, 2.55)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	fire_last = {"shoot1", "shoot2", "shoot3"},
	reload = "reload1",
	reload_empty = "reload1",
	draw = "draw"
}
