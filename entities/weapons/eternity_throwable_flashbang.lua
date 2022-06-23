AddCSLuaFile()
DEFINE_BASECLASS("eternity_grenade_base")

SWEP.Base 			= "eternity_grenade_base"

SWEP.PrintName 		= "M84 Stun Grenade"
SWEP.Author 		= "TankNut"

SWEP.ViewModel 		= Model("models/weapons/c_grenade.mdl")
SWEP.WorldModel 	= Model("models/weapons/w_grenade.mdl")

function SWEP:CreateEntity()
	local ent = ents.Create("ent_throwable_flashbang")
	local ply = self.Owner

	ent:SetPos(ply:GetPos())
	ent:SetAngles(ply:EyeAngles())
	ent:SetOwner(ply)
	ent:Spawn()
	ent:Activate()

	ent:SetTimer(1.5)

	return ent
end