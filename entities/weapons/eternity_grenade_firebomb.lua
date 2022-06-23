AddCSLuaFile()
DEFINE_BASECLASS("eternity_grenade_base")

SWEP.Base 			= "eternity_grenade_base"

SWEP.PrintName 		= "Molotov Cocktail"
SWEP.Author 		= "TankNut"

SWEP.ViewModel 		= Model("models/tnb/weapons/c_bottle.mdl")
SWEP.WorldModel 	= Model("models/tnb/weapons/w_bottle.mdl")

SWEP.VMBodyGroups 		= {[1] = 1}
SWEP.WMBodyGroups 		= {[1] = 1}

function SWEP:CreateEntity()
	local ent = ents.Create("ent_grenade_firebomb")
	local ply = self.Owner

	ent:SetPos(ply:GetPos())
	ent:SetAngles(ply:EyeAngles())
	ent:SetOwner(ply)
	ent:Spawn()
	ent:Activate()

	local item = self:GetItem()

	if item then
		ent.SmokeColor = item.SmokeColor
	end

	ent:SetTimer(0.1)

	return ent
end