AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M40A1"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/v_nam_m40.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_m24.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.PumpAction			= true
SWEP.ShotgunReload		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.35

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.001 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/tfa_nam_m40/m40_revamped.wav")
SWEP.DrySound 			= Sound("weapons/tfa_nam_m40/m40a1_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-2, 1, 1.5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "base_fire_start",
	pump = "base_fire_end",
	fire_last = "base_fire_end",
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end",
	idle = "idle"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	-- if event == 20 then return true end
end
