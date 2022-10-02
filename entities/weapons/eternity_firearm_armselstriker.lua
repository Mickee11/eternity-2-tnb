AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Armsel Striker"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/bocw_streetsweeper.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_striker.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 12
SWEP.Delay 				= 0.45

SWEP.HipCone 			= 0.00 -- Hipfire spread 
SWEP.AimCone 			= 0.00 -- ADS spread

SWEP.Recoil 			= 2.2

SWEP.FireSound 			= Sound("weapons/bocw_streetsweeper/bocw_fire.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/m1014/toz_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-3.9, 2.5, 5)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1.5, 5, 3)
}


SWEP.Animations = {
	draw = "pullout_first",
	fire = {"fire"},
	reload = "reload_in",
	reloadinsert = {"reload_loop", "reload_loop2"},
	reloadfinish = "reload_out"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
