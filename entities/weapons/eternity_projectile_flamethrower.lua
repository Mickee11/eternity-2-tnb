AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "M2 Incinerator Unit"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/halflife2/weapons/c_flamethrower.mdl")
SWEP.WorldModel 		= Model("models/tnb/halflife2/weapons/w_flamethrower.mdl")
SWEP.ModelSkin          = 0

SWEP.HoldType 			= "smg"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_vfire"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= -1
SWEP.Delay 				= 0.05

SWEP.HipCone 			= 0.0 -- Hipfire spread
SWEP.AimCone 			= 0.0 -- ADS spread
SWEP.Recoil 			= 0.5

SWEP.FireSound 			= nil

SWEP.RecoilMult 		= 0

SWEP.DefaultOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(1, -1, -1)
}

SWEP.LoweredOffset = {
	ang = Angle(-10, 35, 0),
	pos = Vector(20, 0, -2)
}

SWEP.AimOffset = {
	ang = Angle(0, 0, 0),
	pos = Vector(-4.5, -4, 2)
}

function SWEP:GetItem()
	return GAMEMODE:GetItem(self:GetItemID())
end

function SWEP:OnDeath()
    local firemode = self:GetFiremode()

    if firemode then
        firemode:OnDeath()
    end
end
