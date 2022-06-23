AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Overwatch Ammunition Resupply"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_combine/combine_dispenser.mdl")
ENT.Color 			= Color(20, 90, 175)

ENT.Cooldown 		= 900 -- 15 minutes

ENT.AmmoTypes 		= {
	["ammo_pulse_basic"] = 200,
	["ammo_pulse_shotgun"] = 50,
	["ammo_pulse_sniper"] = 25
}

GAMEMODE.AmmoBoxCache = GAMEMODE.AmmoBoxCache or {}

local mins = Vector(-10, -32, -22)
local maxs = Vector(0, 32, 60)

function ENT:Initialize()
	self:SetModel(self.Model)

	if IsValid(self.PhysCollide) then
		self.PhysCollide:Destroy()
	end

	self.PhysCollide = CreatePhysCollideBox(mins, maxs)
	self:SetCollisionBounds(mins, maxs)

	if CLIENT then
		self:SetRenderBounds(mins, maxs)
	else
		self:PhysicsInitBox(mins, maxs)
		self:SetSolid(SOLID_VPHYSICS)
		self:PhysWake()

		self:SetUseType(SIMPLE_USE)
	end

	self:EnableCustomCollisions(true)
	self:DrawShadow(true)
end

function ENT:TestCollision(start, delta, isbox, extends)
	if not IsValid(self.PhysCollide) then
		return
	end

	local max = extends
	local min = -extends

	max.z = max.z - min.z
	min.z = 0

	local hit, norm, frac = self.PhysCollide:TraceBox(self:GetPos(), self:GetAngles(), start, start + delta, min, max)

	if not hit then
		return
	end

	return {
		HitPos = hit,
		Normal = norm,
		Fraction = frac
	}
end

if CLIENT then
	local matrix = Matrix()

	matrix:SetTranslation(Vector(-10, 0, 0))

	function ENT:Think()
		self:EnableMatrix("RenderMultiply", matrix)
	end

	function ENT:Draw()
		self:DrawModel()

		local edit = LocalPlayer():IsInEditMode()
		local ready = self:IsReady()

		if edit or not ready then
			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetAngles(), mins, maxs, ColorAlpha(self.Color, 50), true)
		end
	end
else
	function ENT:OnCooldown(ply)
		local last = GAMEMODE.AmmoBoxCache[ply:CharID()]

		if last and last + self.Cooldown >= CurTime() then
			return true, (last + self.Cooldown) - CurTime()
		end

		return false
	end

	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		if not ply:HasCombineLevel(COMBINE_LEVEL_LOWERASSET) then
			self.NextSound = self.NextSound or CurTime()

			if self.NextSound <= CurTime() then
				self:EmitSound("buttons/combine_button_locked.wav")
				self.NextSound = CurTime() + 1
			end

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

		self:ResetSequence("dispense_package")

		coroutine.WrapFunc(function()
			ply:GiveItem(type, data, true)
			ply:SendChat("NOTICE", "You take " .. data .. " rounds out of the cabinet.")
		end)
	end
end
