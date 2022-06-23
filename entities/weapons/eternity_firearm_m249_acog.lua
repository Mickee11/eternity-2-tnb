AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M249 Light Machine Gun \"Acog\""
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_m249.mdl")
SWEP.VMBodyGroups		= {[1] = 2}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_m249.mdl")
SWEP.WMBodyGroups			= {[1] = 2}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 200
SWEP.Delay 				= 0.075

SWEP.HipCone 			= 0.04 -- Hipfire spread 
SWEP.AimCone 			= 0.03 -- ADS spread

SWEP.Recoil 			= 1.25

SWEP.FireSound 			= Sound("eternity.weapon_m249")
SWEP.DrySound 			= Sound("eternity.dry_rifle")

SWEP.RecoilMult 		= 0

SWEP.Scope 				= {
	Enabled = true,
	Zoom = {1.5, 3}
}

SWEP.AimOffset = {
	ang = Angle(0.75, 0, 0),
	pos = Vector(-5.5075, -3.5, 1.29)
}

SWEP.Animations = {
	fire = {"shoot1", "shoot2"},
	fire_last = {"shoot1", "shoot2"},
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if self:AimingDownSights() then
		if event == 5001 then return true end
		if event == 20 then return true end
		if event == 21 then return true end
	end
end
