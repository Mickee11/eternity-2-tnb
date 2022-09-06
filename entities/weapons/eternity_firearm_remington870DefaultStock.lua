AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Remington 870"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/smc/r870/c_remington_m870.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mossberg.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("weapons/remington_870/870_shoot_1.wav")
SWEP.DrySound 			= Sound("weapons/remington_870/870_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.4, 2, 1.4)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 5, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire_1"},
	pump = "base_fire_cock_1",
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end