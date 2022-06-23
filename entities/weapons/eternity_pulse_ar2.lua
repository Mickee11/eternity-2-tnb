AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Overwatch Rifle Mk. 2"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/weapons/v_irifle.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/weapons/w_irifle.mdl")
SWEP.WMBodyGroups		= {[1] = 0}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"},
	{Mode = "firemode_semi"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.Delay 				= 0.15

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 1.0

SWEP.FireSound 			= Sound("eternity.weapon_pulse_ar2")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-5.8, -5, 2.4)
}

SWEP.Animations = {
	fire = {"ir_fire"},
	fire_last = "ir_fire",
	reload = "ir_reload",
	reload_empty = "ir_reload",
	draw = "ir_draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 6001 then return true end
	if event == 5001 then return true end
	if event == 20 then return true end
	if event == 21 then return true end
end
