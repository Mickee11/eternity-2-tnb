AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Walther P99"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_pist_p99.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_p99.mdl")

SWEP.ModelSkin			= 0

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 15
SWEP.Delay 				= 0.185

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("weapons/p99/fire.wav")
SWEP.DrySound 			= Sound("weapons/p99/empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0.3, 0, 0),
	pos = Vector(-1.87, 0, 0.4)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	fire = {"base_fire", "base_fire2", "base_fire3"},
	fire_last = {"base_firelast"},
	reload = "base_reloadempty",
	draw = "base_draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end
