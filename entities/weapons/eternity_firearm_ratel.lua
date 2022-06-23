AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Ratel Compact Shotgun"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_alyx_shotgun.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_alyx_shotgun.mdl")

SWEP.HoldType 			= "ratel"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 6
SWEP.Delay 				= 0.45

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.5

SWEP.FireSound 			= Sound("eternity.weapon_m1014")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-6.34, -2, 1.23)
}

SWEP.Animations = {
	draw = "draw1",
	draw_empty = "draw2",
	fire = "fire1",
	fire_last = "fire2",
	reload = "open1",
	reload_empty = "open2",
	reloadfirst = "loadempty",
	reloadinsert = "load1",
	reloadfinish = "close"
}
