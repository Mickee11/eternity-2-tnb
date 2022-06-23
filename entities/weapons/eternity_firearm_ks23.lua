AddCSLuaFile()

SWEP.Base				= "eternity_firearm_base"

SWEP.PrintName			= "KS-23"
SWEP.Auther				= "Mickee"

SWEP.ViewModel			= Model("models/tnb/weapons/c_ks23.mdl")

SWEP.WorldModel			= Model("models/tnb/weapons/w_ks23.mdl")

SWEP.HoldType			= "ar2"
SWEP.HoldTypeLowered	= "passive"

SWEP.Firemodes			= {
	{Mode = "firemode_semi"}
}

SWEP.ShotgunReload		= true

SWEP.Animated			= true
SWEP.AnimatedADS		= true

SWEP.ClipSize			= 4
SWEP.Delay				= 1

SWEP.HipCone			= 0.05 -- Hipfire Spread
SWEP.AimCone			= 0.025 -- ADS Spread

SWEP.Recoil				= 2.5

SWEP.FireSound			= Sound("tekka/weapons/weapon_warhammer.wav")
SWEP.DrySound			= Sound("eternity.dry_rifle")

SWEP.RecoilMult			= 0

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