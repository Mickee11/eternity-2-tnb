AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Colt Cobra"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/tfa_ins2/c_thanez_cobra.mdl")
SWEP.VMBodyGroups		= {[2] = 6}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_magnum.mdl")

SWEP.HoldType 			= "revolver"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= false

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 6
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.075 -- Hipfire spread 
SWEP.AimCone 			= 0.05 -- ADS spread

SWEP.Recoil 			= 1.2

SWEP.FireSound 			= Sound("weapons/tfa_ins2/thanez_cobra/revolver_fp.wav")
SWEP.DrySound 			= Sound("weapons/tfa_ins2/thanez_cobra/revolver_empty.wav")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-2.4, 0, -0.25)
}

SWEP.DefaultOffset = {
    ang = Angle(0, 0, 0),
    pos = Vector(0, 3, -2)
}

SWEP.Animations = {
	draw = "base_draw",
	fire = {"base_fire"},
	reload = "base_reload_speed"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
