AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Benelli M1014 \"Short\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_xm.mdl")
SWEP.VMBodyGroups		= {[1] = 1}


SWEP.WorldModel 		= Model("models/tnb/weapons/w_xm.mdl")
SWEP.WMBodyGroups		= {[1] = 1}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 7
SWEP.Delay 				= 0.45

SWEP.HipCone 			= 0.00 -- Hipfire spread 
SWEP.AimCone 			= 0.00 -- ADS spread

SWEP.Recoil 			= 2.0

SWEP.FireSound 			= Sound("eternity.weapon_m1014")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, -0.775, 0),
	pos = Vector(-7.0085, -2, 2.05)
}

SWEP.Animations = {
	draw = "draw",
	fire = {"shoot2"},
	reload = "start_reload",
	reloadinsert = "insert",
	reloadfinish = "after_reload"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
