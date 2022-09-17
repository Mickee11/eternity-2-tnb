AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M40A1"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/v_nam_m40.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_mosin.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.35

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.005 -- ADS spread

SWEP.Recoil 			= 2.3

SWEP.FireSound 			= Sound("weapons/tfa_nam_m40/m40a1_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_nam_m40/m40a1_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2, -1, 1.75)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -1)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = "iron_fire_start",
	pump = "iron_fire_end",
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end",
	idle = "idle"
}


function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
