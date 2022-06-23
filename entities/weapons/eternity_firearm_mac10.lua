AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Ingram MAC-10"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mac10.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mac10.mdl")
SWEP.WMBodyGroups			= {[1] = 0}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 32
SWEP.Delay 				= 0.0825

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.05

SWEP.FireSound 			= Sound("eternity.weapon_mac10")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-5.355, -7.5, 1.675)
}

SWEP.Animations = {
	fire = "fireempty",
	fire_last = "fireempty",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
