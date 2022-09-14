AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M1911"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/m1911/c_m1911.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_1911.mdl")

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 0.165

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.2

SWEP.FireSound 			= Sound("weapons/tfa_inss/m1911/m1911_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_inss/m1911/m1911_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.45, 2, 1.05)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, 0)
}


SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = {"base_firelast"},
	reload = "base_reload",
	reload_empty = "base_reloadempty",
	draw = "base_draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end