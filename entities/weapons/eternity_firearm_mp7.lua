AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Heckler & Koch MP7"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_mp7.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_mp7.mdl")
SWEP.WMBodyGroups			= {[1] = 0}

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.06

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 0.9

SWEP.FireSound 			= Sound("eternity.weapon_mp7")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-6.4, -5.5, 0.875)
}

SWEP.Animations = {
	fire = "fire01",
	fire_last = "fire01",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
end
