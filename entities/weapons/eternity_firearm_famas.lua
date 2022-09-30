AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "FAMAS F1"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_famas.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_famas.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 25
SWEP.Delay 				= 0.1

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.925

SWEP.FireSound 			= Sound("weapons/tfa_ins2/famas/famas_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/famas/famas_empty.wav")

SWEP.RecoilMult 		= 0



SWEP.AimOffset = {
	ang = Angle(0.5, 0, 0),
	pos = Vector(-3.4, 0, 0.8)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, 0)
}

SWEP.Animations = {
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 0 / 0, snd = "weapons/tfa_ins2/famas/famas_boltback.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/famas/famas_magout.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/famas/famas_magin.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/famas/famas_rattle.wav"},
	},
	base_reload_empty = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/famas/famas_boltback.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/famas/famas_magout.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/famas/famas_magin.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/famas/famas_rattle.wav"},
		{time = 100 / 30, snd = "weapons/tfa_ins2/famas/famas_boltrelease.wav"},
		{time = 105 / 30, snd = "weapons/tfa_ins2/famas/famas_boltback.wav"},
	}
}