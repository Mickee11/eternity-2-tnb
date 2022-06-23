AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Overwatch Sniper Weapon System"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_cisr.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_cisr.mdl")
SWEP.WMBodyGroups		= {[1] = 0}

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.0

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.001 -- ADS spread

SWEP.Recoil 			= 2.5

SWEP.FireSound 			= Sound("eternity.weapon_pulse_sniper")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {10}
}

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-6.175, -10, 1.5)
}

SWEP.Animations = {
	fire = {"shoot", "shoot2"},
	fire_last = {"shoot", "shoot2"},
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
