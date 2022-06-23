AddCSLuaFile()
DEFINE_BASECLASS("ent_portal_in")

ENT.Base 			= "ent_portal_in"
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT

ENT.PrintName 		= "Portal (Two-way)"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(127, 255, 255)

ENT.ExitType 		= "ent_portal_twoway"

ENT.LightParams 	= {
	r = 127,
	g = 255,
	b = 255
}
