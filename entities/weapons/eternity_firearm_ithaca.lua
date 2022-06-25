AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Ithaca Model 37"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/arccw/c_bo1_ithaca.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ithaca.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("tekka/weapons/weapon_warhammer.wav")
SWEP.DrySound 			= Sound("weapons/arccw_ud/870/dryfire.ogg")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.18, 2, 1.25)
}

SWEP.Animations = {
	draw = "draw",
	fire = {"shoot2"},
	reload = "reload_in",
	reloadinsert = "reload_loop",
	reloadfinish = "reload_out"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
