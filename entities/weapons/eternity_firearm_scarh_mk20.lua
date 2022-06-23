AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "SCAR-H Mk 20 SSR"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_scar.mdl")
SWEP.VMBodyGroups		= {[1] = 7}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_scar.mdl")
SWEP.WMBodyGroups		= {[1] = 7}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.092

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.001 -- ADS spread

SWEP.Recoil 			= 1

SWEP.FireSound 			= Sound("eternity.weapon_scar.sd")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.LimitTracers		= true
SWEP.LimitTracerNum		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {3, 6}
}

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-6.365, -5, -0.19)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 6001 then return true end
	if event == 5001 then return true end
	if event == 20 then return true end
	if event == 21 then return true end
end
