AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M249 Light Machine Gun \"Aimpoint\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_m249.mdl")
SWEP.VMBodyGroups		= {[1] = 3}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_m249.mdl")
SWEP.WMBodyGroups			= {[1] = 3}

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 200
SWEP.Delay 				= 0.075

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 1.15

SWEP.FireSound 			= Sound("eternity.weapon_m249")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.75, 0, 0),
	pos = Vector(-5.5125, -3.5, 1.08)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2"},
	fire_last = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}
