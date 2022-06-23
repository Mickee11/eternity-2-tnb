AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SCAR-H CQC"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_scar.mdl")
SWEP.VMBodyGroups		= {[1] = 5}
SWEP.VMSubMaterials 	= {[2] = true}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_scar.mdl")
SWEP.WMBodyGroups		= {[1] = 5}
SWEP.WMSubMaterials 	= {[5] = true}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.092

SWEP.HipCone 			= 0.07 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 0.8

SWEP.FireSound 			= Sound("eternity.weapon_scar")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-6.38, -5, 0.355)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	draw = "draw"
}
