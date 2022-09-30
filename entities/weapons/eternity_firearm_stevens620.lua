AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Stevens 620"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_nam_stevens620.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ithaca.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_nam_stevens620/stevens620_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_nam_stevens620/stevens620_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2, 2, 0.9)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire_1",
	pump = "base_fire_cock_1",
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
