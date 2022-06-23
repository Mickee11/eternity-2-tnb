AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Ingram MAC-10 \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mac10.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mac10.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 32
SWEP.Delay 				= 0.0825

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 1.05

SWEP.FireSound 			= Sound("eternity.weapon_mac10.sd")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.LimitTracers		= true

SWEP.RecoilMult 		= 0

SWEP.HideTracers		= true

SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-5.355, -7.5, 1.5)
}

SWEP.Animations = {
	fire = "fireempty",
	fire_last = "fireempty",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
