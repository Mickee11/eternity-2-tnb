AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Glock 19"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/v_glock19.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_glock.mdl")

SWEP.ModelSkin			= 0

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 17
SWEP.Delay 				= 0.185

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/glock_19/glock18-1.wav")
SWEP.DrySound 			= Sound("weapons/p99/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.2, 0, 0),
	pos = Vector(-2, 0, 0.4)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = {"base_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 0 / 0, snd = "weapons/glock_19/glock_slideback.wav"},
		{time = 0 / 0, snd = "weapons/glock_19/glock_clipout.wav"},
		{time = 0 / 0, snd = "weapons/glock_19/glock_clipin.wav"},
		{time = 0 / 0, snd = "weapons/glock_19/glock_maghit.wav"},
	},
	base_reloadempty = {
		{time = 0 / 30, snd = "weapons/glock_19/glock_slideback.wav"},
		{time = 0 / 30, snd = "weapons/glock_19/glock_clipout.wav"},
		{time = 0 / 30, snd = "weapons/glock_19/glock_clipin.wav"},
		{time = 0 / 30, snd = "weapons/glock_19/glock_maghit.wav"},
		{time = 71 / 30, snd = "weapons/glock_19/glock_sliderelease.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end
