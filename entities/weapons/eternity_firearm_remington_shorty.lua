AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Remington 870 Shorty"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_shorty.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_shorty.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.AmmoGroup 			= "12gauge"

SWEP.ClipSize 			= 4
SWEP.Delay 				= 1

SWEP.HipCone 			= 0.075 -- Hipfire spread 
SWEP.AimCone 			= 0.05 -- ADS spread

SWEP.Recoil 			= 1.8

SWEP.FireSound 			= Sound("eternity.weapon_remington_shorty")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(5, 0, 0),
	pos = Vector(-7.9, -3.5, 0.4)
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
