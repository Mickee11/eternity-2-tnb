AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M24"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/smc/m24/c_m24.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_m24.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.35

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.001 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/m24sws/m24_shoot_default.wav")
SWEP.DrySound 			= Sound("weapons/m24sws/m24_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 1),
	pos = Vector(-3.2, 3, 1.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 5, 0.5)
}

SWEP.Animations = {
	fire = "base_fire_start",
	pump = "base_fire_end",
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end_empty",
	idle = "base_idle",
	draw = "base_draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	-- if event == 20 then return true end
end
