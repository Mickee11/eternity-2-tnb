AddCSLuaFile()
DEFINE_BASECLASS("ent_baseportal")

ENT.Base 			= "ent_baseportal"
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT

ENT.PrintName 		= "Portal (Exit)"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(100, 200, 0)

ENT.LightParams 	= {
	r = 100,
	g = 200,
	b = 0
}

if SERVER then
	function ENT:OnInitialLoad()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	end
end
