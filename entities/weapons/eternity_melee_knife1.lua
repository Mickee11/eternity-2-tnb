AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Knife"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_knife.mdl")
SWEP.WorldModel 		= Model("models/weapons/w_knife_ct.mdl")

SWEP.HoldType 			= "knife"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Delay 				= 0.6

SWEP.Animations = {
	idle = "idle",
	hit = {"midslash1"},
	miss = {"midslash1"}
}

function SWEP:Deploy()
	BaseClass.Deploy(self)
end

function SWEP:GetDamage()
	return 15, DMG_SLASH
end

function SWEP:GetCDamage()
	return 0
end

function SWEP:OnHit()
	self:EmitSound("eternity.knife_hit")
end

function SWEP:OnMiss()
    self:EmitSound("eternity.knife_slash")
end
