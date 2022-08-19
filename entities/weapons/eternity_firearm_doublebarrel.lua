AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Double Barrel"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_nam_doublebarrel.mdl")
SWEP.WorldModel 		= Model("models/weapons/w_doublebarrel_new.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 2
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("weapons/tfa_doublebarrel/double_barrel_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_doublebarrel/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-7.9225, -2, 2.75)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire"},
	reload = "base_reloadempty",
	reloadinsert = "",
	reloadfinish = "base_ready2"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
