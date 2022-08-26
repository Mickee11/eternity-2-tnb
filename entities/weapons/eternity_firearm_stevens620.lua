AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Stevens 620"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_nam_stevens620.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_nam_stevens620.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= false

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.2

SWEP.FireSound 			= Sound("weapons/tfa_nam_stevens620/stevens620_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_nam_stevens620/stevens620_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(2.18, -5, 1.25)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire_cock_1"},
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reload_empty = "base_reload_start_empty",
	reloadfinish = "base_reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end