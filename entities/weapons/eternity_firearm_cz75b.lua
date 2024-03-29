AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Cz75B"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_cz75b.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_p220.mdl")

SWEP.ModelSkin			= 0

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 16
SWEP.Delay 				= 0.185

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/tfa_ins2/cz75/fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/cz75/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.2, 0, 0),
	pos = Vector(-2, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}


SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = "base_firelast",
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/boltback.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/magout.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/magin.wav"},
		{time = 0 / 0, snd = "weapons/tfa_ins2/cz75/maghit.wav"},
	},
	base_reload_empty = {
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/boltback.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/magout.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/magin.wav"},
		{time = 0 / 30, snd = "weapons/tfa_ins2/cz75/maghit.wav"},
		{time = 70 / 30, snd = "weapons/tfa_ins2/cz75/boltrelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end