AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Prototype Pulse Rifle"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_akm_elysium.mdl")

SWEP.WorldModel 		= Model("models/tnb/weapons/w_akm_elysium.mdl")

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_sputter"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 30
SWEP.DelayMin 			= 0.1
SWEP.DelayMax 			= 0.3

SWEP.HipCone 			= 0.09 -- Hipfire spread 
SWEP.AimCone 			= 0.02 -- ADS spread

SWEP.Recoil 			= 0.75

SWEP.FireSound 			= Sound("eternity.weapon_pulse_pdw")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.DefaultOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(2, 0, -1)
}

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-2.89, -3, -0.35)
}

SWEP.Animations = {
	fire = "base_fire",
	reload = "base_reload",
	reload_empty = "base_reload_empty",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 21 then
		return true
	end
end
