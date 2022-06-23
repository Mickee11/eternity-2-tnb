AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SKS; ACOG"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_sks.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_sks.mdl")

SWEP.VMBodyGroups 		= {[1] = 1}
SWEP.WMBodyGroups 		= {[1] = 1}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.AmmoGroup 			= "762x39mm"

SWEP.ClipSize 			= 10
SWEP.Delay 				= 0.25

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.00350 -- ADS spread

SWEP.Recoil 			= 1.5

SWEP.FireSound 			= Sound("eternity.weapon_sks")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {3}
}

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-6.375, -5, 3.5)
}

SWEP.Animations = {
	fire = {"shoot1"},
	fire_last = "shoot1",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
    if event == 5001 then return true end
    if event == 21 then return true end
end
