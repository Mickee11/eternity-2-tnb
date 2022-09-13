AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Ammunition Resupply"
ENT.Category 		= "Eternity.Common Entities"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/Items/ammocrate_smg1.mdl")
ENT.Color 			= Color(0, 127, 31)

ENT.Cooldown 		= 900 -- 15 minutes

-- ["ammo item"] = return
ENT.AmmoTypes 		= {
	["ammo_9x19mm"] = 100,
	["ammo_9x18mm"] = 100,
	["ammo_45acp"] = 100,
	["ammo_46x30mm"] = 100,
	["ammo_303british"] = 100,
	["ammo_357magnum"] = 20,
	["ammo_556x45mm"] = 100,
	["ammo_762x39mm"] = 100,
	["ammo_762x51mm"] = 100,
	["ammo_12gauge_buckshot"] = 50,
	["ammo_12gauge_slug"] = 20,
	["ammo_pulse_basic"] = 50,
	["ammo_pulse_shotgun"] = 10,
	["ammo_pulse_sniper"] = 5
}

GAMEMODE.AmmoBoxCache = GAMEMODE.AmmoBoxCache or {}

function ENT:Initialize()
	self:SetModel(self.Model)
	self:SetBodyGroups(0, 1)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:EnableMotion(false)
		end

		self:SetUseType(SIMPLE_USE)
	end

	self:DrawShadow(true)
end

function ENT:OnCooldown(ply)
	local last = GAMEMODE.AmmoBoxCache[ply:CharID()]

	if last and last + self.Cooldown >= CurTime() then
		return true, (last + self.Cooldown) - CurTime()
	end

	return false
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()

		local edit = LocalPlayer():IsInEditMode()
		local ready = self:IsReady()

		if edit or not ready then
			local mins = self:OBBMins() - Vector(0.1, 0.1, 0.1)
			local maxs = self:OBBMaxs() + Vector(0.1, 0.1, 0.1)

			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetAngles(), mins, maxs, ColorAlpha(self.Color, 50), true)
		end
	end
else
	function ENT:Think()
		if self.IsOpen and self:IsSequenceFinished() then
			self.IsOpen = false
			self:ResetSequence("close")
		end
	end

	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		local cooldown, remaining = self:OnCooldown(ply)

		if cooldown then
			ply:SendChat("ERROR", "You cannot use this for another " .. string.NiceTime(remaining) .. "!")

			return
		end

		local weapon = ply:GetActiveWeapon()

		if weapon == nil then
			return
		end

		if not weapons.IsBasedOn(weapon:GetClass(), "eternity_firearm_base") then
			return
		end

		local type = weapon:GetAmmoType()

		if type == "" then
			ply:SendChat("ERROR", "You do not have any ammo loaded into your weapon!")

			return
		end

		local data = self.AmmoTypes[type]

		if not data then
			ply:SendChat("ERROR", "The cabinet doesn't have that type of ammo!")

			return
		end

		GAMEMODE.AmmoBoxCache[ply:CharID()] = CurTime()

		self:EmitSound("BaseCombatCharacter.AmmoPickup")

		self.IsOpen = true
		self:ResetSequence("open")

		coroutine.WrapFunc(function()
			ply:GiveItem(type, data, true)
			ply:SendChat("NOTICE", "You take " .. data .. " rounds out of the cabinet.")
		end)
	end
end
