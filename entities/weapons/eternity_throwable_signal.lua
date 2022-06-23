AddCSLuaFile()
DEFINE_BASECLASS("eternity_throwable_smoke")

SWEP.Base 			= "eternity_throwable_smoke"

SWEP.PrintName 		= "AN-M18 Colored Grenade"
SWEP.Author 		= "TankNut"

SWEP.ViewModel 		= Model("models/weapons/c_grenade.mdl")
SWEP.WorldModel 	= Model("models/weapons/w_grenade.mdl")

function SWEP:Deploy()
	BaseClass.Deploy(self)

	if self:GetItem() then
		self.PrintName = string.format("%s (%s)", "AN-M18 Colored Grenade", self:GetItem().SmokeTitle)
	end
end
