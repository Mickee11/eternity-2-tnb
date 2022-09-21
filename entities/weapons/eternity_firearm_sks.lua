AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SKS"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/sks_ins/v_sks.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_sks.mdl")
SWEP.BodyGroups			= {[1] = 0}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.1

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.4

SWEP.FireSound 			= Sound("weapons/tfa_ins2/m4a1/m4a1_fire.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/m4a1/m4a1_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-6.52, -7.5, 1.1)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -2)
}

SWEP.Animations = {
	fire = {"base_fire"},
	firelast = "base_firelast",
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}