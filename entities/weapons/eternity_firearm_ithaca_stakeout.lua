AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Ithaca Model 37 \"Stakeout\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_ithaca.mdl")
SWEP.VMBodyGroups		= {[1] = 1}
SWEP.WorldModel 		= Model("models/tnb/weapons/w_ithaca.mdl")
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
SWEP.Delay 				= 0.95

SWEP.HipCone 			= 0.05 -- Hipfire spread 
SWEP.AimCone 			= 0.025 -- ADS spread

SWEP.Recoil 			= 2.5

SWEP.FireSound 			= Sound("eternity.weapon_ithaca")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(2, 0, 0),
	pos = Vector(-7.875, -2, 1.75)
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
