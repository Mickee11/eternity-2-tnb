AddCSLuaFile()

ENT.Base 					= "base_anim"
ENT.Type 					= "anim"

ENT.Author 					= "TankNut"

ENT.RenderGroup 			= RENDERGROUP_OPAQUE

ENT.Spawnable 				= false
ENT.AdminSpawnable			= false

ENT.Damage 					= 150
ENT.Radius 					= 350

ENT.RampUp 					= 2
ENT.RampDown 				= 1

function ENT:Initialize()
	self:SetModel("models/props_lab/cactus.mdl")

	self:SetNoDraw(true)

	if CLIENT then
		EmitSound("Weapon_Mortar.Single", vector_origin, -1, CHAN_AUTO, 0.2)
	else
		local data = EffectData()

		data:SetOrigin(self:GetPos())
		data:SetRadius(350)

		util.Effect("eternity_combinemortar", data, true, true)
	end
end

if SERVER then
	function ENT:Think()
		self:NextThink(CurTime())

		local time = CurTime() - self:GetCreationTime()

		if time > self.RampUp - 1 and not self.Sound then
			self:EmitSound("Weapon_Mortar.Incomming")

			self.Sound = true
		end

		if time > self.RampUp and not self.Explode then
			self:EmitSound("Weapon_Mortar.Impact")

			local dmg = DamageInfo()

			dmg:SetAttacker(self:GetOwner())
			dmg:SetInflictor(self)
			dmg:SetDamage(self.Damage)
			dmg:SetDamageType(DMG_DISSOLVE)
			dmg:SetDamagePosition(self:GetPos())

			util.BlastDamageInfo(dmg, self:GetPos(), self.Radius)

			self.Explode = true
		end

		if time > self.RampUp + self.RampDown then
			SafeRemoveEntity(self)
		end

		return true
	end
end
