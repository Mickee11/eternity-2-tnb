AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Double Barrel"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/v_nam_doublebarrel.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_sawnoff.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}


SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 2
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_doublebarrel/double_barrel_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_doublebarrel/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.8, 2, 1.25)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire"},
	reload = "base_reload",
	reload_empty = "base_reloadempty"
}

SWEP.SoundScripts = { -- Stolen from the TFA version of the weapon
	base_reload = {
		{time = 0 / 0, snd = "weapons/tfa_doublebarrel/breakopen.wav"},
		{time = 0 / 0, snd = "weapons/tfa_doublebarrel/shelleject1.wav"},
		{time = 0 / 0, snd = "weapons/tfa_doublebarrel/shellinsert1.wav"},
		{time = 0 / 0, snd = "weapons/tfa_doublebarrel/breakclose.wav"},
	},
	base_reloadempty = {
		{time = 0 / 30, snd = "weapons/tfa_doublebarrel/breakopen.wav"},
		{time = 0 / 30, snd = "weapons/tfa_doublebarrel/shellseject.wav"},
		{time = 0 / 30, snd = "weapons/tfa_doublebarrel/shellinsert1.wav"},
		{time = 0 / 30, snd = "weapons/tfa_doublebarrel/shellinsert2.wav"},
		{time = 80 / 30, snd = "weapons/tfa_doublebarrel/breakclose.wav"},
	}
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end