AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Steyr AUG"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/inss_aug/v_aug_v4.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_aug.mdl")
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

SWEP.FireSound 			= Sound("weapons/aug/aug_fp.wav")
SWEP.DrySound 			= Sound("weapons/aug/aug_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-2.75, 5, 1.575)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 4, 0)
}

SWEP.Animations = {
	fire = {"base_fire"},
	reload = "base_reload",
	draw = "base_draw"
}
