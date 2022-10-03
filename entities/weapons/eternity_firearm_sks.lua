AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SKS"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/sks_ins/v_sks.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_sks.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.2

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.9

SWEP.FireSound 			= Sound("eternity.weapon_sks")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(2, 2, -1.5)
}


SWEP.Animations = {
	fire = {"base_fire"},
	fire_last = {"base_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/boltback.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/magout.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/magin.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/maghit.wav"},
	},
	base_reloadempty = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/boltback.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/magout.wav"},
		{time = 35 / 30, snd = "weapons/mp443/m9_magin.wav"},
		{time = 38 / 30, snd = "weapons/mp443/m9_maghit.wav"},
		{time = 0 / 30, snd = "weapons/mp443/m9_boltrelease.wav"},
	}
}