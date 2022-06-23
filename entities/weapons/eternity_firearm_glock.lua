AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Glock 17"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_glock.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_glock.mdl")
SWEP.BodyGroups			= {[1] = 0}

SWEP.HoldType 			= "pistol"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 17
SWEP.Delay 				= 0.165

SWEP.HipCone 			= 0.02 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.9

SWEP.FireSound 			= Sound("eternity.weapon_glock")
SWEP.DrySound 			= Sound("eternity.dry_pistol")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(1, 0, 0),
	pos = Vector(-6.4, -7.5, 2.875)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2", "shoot3"},
	fire_last = {"shoot1", "shoot2", "shoot3"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 5001 then return true end
	if event == 20 then return true end
end
