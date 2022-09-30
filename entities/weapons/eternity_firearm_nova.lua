AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Benelli Nova"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_nova.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mossberg.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}
SWEP.ShotgunReload		= true
SWEP.PumpAction			= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 8
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.8

SWEP.FireSound 			= Sound("weapons/tfa_ins2/nova/nova_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/nova/nova_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(-0.25, 0, 0),
	pos = Vector(-2.05, 2, 1)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(1, 2.5, -1.2)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire_1", "base_fire_2"},
	firelast = "base_firelast",
	pump = {"base_fire_cock_1", "base_fire_cock_2"},
	reload = "base_reload_start",
	reloadinsert = "base_reload_insert",
	reloadfinish = "base_reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end