AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Browning Auto-5"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/beck_auto5.mdl")

SWEP.WorldModel 		= Model("models/weapons/w_ins2_auto5.mdl")

SWEP.HoldType 			= "shotgun"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 0.45

SWEP.HipCone 			= 0.00 -- Hipfire spread 
SWEP.AimCone 			= 0.00 -- ADS spread

SWEP.Recoil 			= 2.2

SWEP.FireSound 			= Sound("weapons/auto5/toz_194m_fire_1.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/m1014/toz_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, -2, 5),
	pos = Vector(-3.5, 0, 0)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(2, 2, -1.5)
}


SWEP.Animations = {
	draw = "draw",
	fire = {"shoot"},
	reload = "reload_start",
	reloadinsert = "reload_loop",
	reloadfinish = "reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
