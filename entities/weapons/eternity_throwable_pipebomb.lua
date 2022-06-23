AddCSLuaFile()
DEFINE_BASECLASS("eternity_grenade_base")

SWEP.Base 			= "eternity_grenade_base"

SWEP.PrintName 		= "Improvised Explosive Device"
SWEP.Author 		= "TankNut"

SWEP.ViewModel 		= Model("models/tnb/trpweapons/c_pipebomb.mdl")
SWEP.WorldModel 	= Model("models/tnb/trpweapons/w_pipebomb.mdl")

function SWEP:CreateEntity()
	local ent = ents.Create("ent_throwable_pipebomb")
	local ply = self.Owner

	ent:SetPos(ply:GetPos())
	ent:SetAngles(ply:EyeAngles())
	ent:SetOwner(ply)
	ent:Spawn()
	ent:Activate()

	ent:SetTimer(3)

	return ent
end