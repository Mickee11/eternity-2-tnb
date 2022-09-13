AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Manurhin MR96"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/c_ins2_revolver_mr96.mdl")
SWEP.VMBodyGroups		= {[2] = 6}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_magnum.mdl")

SWEP.HoldType 			= "revolver"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 6
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.075 -- Hipfire spread 
SWEP.AimCone 			= 0.05 -- ADS spread

SWEP.Recoil 			= 0.9

SWEP.FireSound 			= Sound("weapons/tfa_ins2/mr96/mr96_short.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/mr96/revolver_empty.wavl")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-1.8, 0, 0.75)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, 0)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire"},
	reload = "base_reload_start",
	reloadinsert = "base_reload_",
	reloadfinish = "base_reload_end"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
