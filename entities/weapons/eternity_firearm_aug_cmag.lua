AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Steyr AUG \"C-Mag\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_aug.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_aug.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 100
SWEP.Delay 				= 0.095

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 0.95

SWEP.FireSound 			= Sound("eternity.weapon_aug")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {1.5}
}

SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-6.375, -7.5, 1.575)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	fire_last = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
