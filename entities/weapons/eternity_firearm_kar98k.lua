AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Kar98K"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_k98.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_k98.mdl")

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

SWEP.FireSound 			= Sound("weapons/tfa_ins2/k98/m40a1_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/k98/m40a1_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 1),
	pos = Vector(-4.25, 2, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1.5, 5, -1)
}

SWEP.Animations = {
	fire = "base_fire_start",
	pump = "base_fire_end",
	fire_last = "base_firelast",
	reload = "reload_start",
	reloadinsert = "reload_insert",
	reloadfinish = "reload_end",
	draw = "base_draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	-- if event == 20 then return true end
end
