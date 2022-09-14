AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M14 EBR"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/ebr_14/v_m14.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_m14.mdl")
SWEP.WMBodyGroups			= {[1] = 1}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 10
SWEP.Delay 				= 0.2

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.5

SWEP.FireSound 			= Sound("weapons/tfa_at_ebr_14/fp141.wav")
SWEP.DrySound 			= Sound("weapons/tfa_at_ebr_14/empty141.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1.5, -0.1, 0),
	pos = Vector(-6.45, -7.5, 3.25)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -2)
}

SWEP.Animations = {
	fire = {"base_fire"},
	fire_last = {"base_fire_last"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}
