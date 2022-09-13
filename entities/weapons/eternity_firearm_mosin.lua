AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Mosin Nagant"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_mosin_nagant.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_mosin.mdl")

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.35

SWEP.HipCone 			= 0.5 -- Hipfire spread 
SWEP.AimCone 			= 0.005 -- ADS spread

SWEP.Recoil 			= 1.9

SWEP.FireSound 			= Sound("weapons/mosin_nagant/mosin_fp.wav")
SWEP.DrySound 			= Sound("weapons/mosin_nagant/mosin_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(5, 0, 0),
	pos = Vector(-6.7, -1, -1)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -2)
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
end
