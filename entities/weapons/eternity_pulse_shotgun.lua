AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Overwatch Tactical Shotgun"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_overwatchshotgun.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_overwatchshotgun.mdl")
SWEP.WMBodyGroups		= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload 		= true

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 4
SWEP.Delay 				= 0.9

SWEP.HipCone 			= 0.0 -- Hipfire spread 
SWEP.AimCone 			= 0.0 -- ADS spread

SWEP.Recoil 			= 2.0

SWEP.FireSound 			= Sound("eternity.weapon_pulse_shotgun")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {1.5}
}

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-7.9, -10, 1.0)
}

SWEP.Animations = {
	draw = "draw",
	fire = {"shoot2"},
	reload = "start_reload",
	reloadinsert = "insert",
	reloadfinish = "after_reload"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 6001 then return true end
	if event == 5001 then return true end
	if event == 20 then return true end
	if event == 21 then return true end
end
