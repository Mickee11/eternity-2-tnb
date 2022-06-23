AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Gunsmith Bench"
ENT.Category 		= "Eternity.Crafting"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/mosi/fallout4/furniture/workstations/weaponworkbench02.mdl")

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

	return tab
end

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
		self:SetUseType(SIMPLE_USE)
	end
end

if SERVER then
	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		local weapon = ply:GetActiveWeapon()

		if weapon == nil then
			return
		end

		if not weapons.IsBasedOn(weapon:GetClass(), "eternity_firearm_base") then
			return
		end

		local item = weapon:GetItem()

		if #table.GetKeys(item.Variants) == 0 then
			ply:SendChat("ERROR", "That weapon does not have any available modifications.")

			return
		end

		ply:OpenGUI("GunsmithMenu", weapon, item)
	end
end