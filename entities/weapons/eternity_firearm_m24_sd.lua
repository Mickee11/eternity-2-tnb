AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M24 Sniper Weapon System \"SD\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_m24.mdl")
SWEP.VMBodyGroups		= {[1] = 1}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_m24.mdl")
SWEP.WMBodyGroups		= {[1] = 1}

SWEP.HoldType 			= "sniper"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 5
SWEP.Delay 				= 1.35

SWEP.HipCone 			= 0.6 -- Hipfire spread 
SWEP.AimCone 			= 0.0025 -- ADS spread

SWEP.Recoil 			= 1.2

SWEP.FireSound 			= Sound("eternity.weapon_m24.sd")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.LimitTracers		= true
SWEP.LimitTracerNum		= 2

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {6}
}

SWEP.AimOffset = {
	ang = Angle(1.5, -0.1, 0),
	pos = Vector(-6.45, -7.5, 1.75)
}

SWEP.Animations = {
	fire = "shoot",
	fire_last = "shoot",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	-- if event == 20 then return true end
end
