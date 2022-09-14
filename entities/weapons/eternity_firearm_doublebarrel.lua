AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Double Barrel"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_nam_doublebarrel.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_sawnoff.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= false

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 2
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_doublebarrel/double_barrel_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_doublebarrel/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-1.75, -1, 1)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire"},
	reload_empty = "base_reloadempty",
	reloadfinish = "idle"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
