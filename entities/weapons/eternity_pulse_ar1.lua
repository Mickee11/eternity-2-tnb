AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Overwatch Rifle Mk. 1"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_ar1.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ar1.mdl")
SWEP.WMBodyGroups		= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 15
SWEP.Delay 				= 0.3

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 0.8

SWEP.FireSound 			= Sound("eternity.weapon_pulse_ar1")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {2}
}

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-6.175, -10, 0.0)
}

SWEP.Animations = {
	fire = {"fire01"},
	fire_last = "fire01",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 6001 then return true end
	if event == 5001 then return true end
	if event == 20 then return true end
	if event == 21 then return true end
end
