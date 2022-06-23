AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Winchester Model 24 \"Sawn Off\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_sawnoff.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_sawnoff.mdl")
SWEP.WMBodyGroups		= {[1] = 1}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= false

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 2
SWEP.Delay 				= 0.25

SWEP.HipCone 			= 0.075 -- Hipfire spread 
SWEP.AimCone 			= 0.05 -- ADS spread

SWEP.Recoil 			= 3

SWEP.FireSound 			= Sound("eternity.weapon_winchester")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(2, 0, 0),
	pos = Vector(-5.89, -2, 3.75)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	fire_last = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
