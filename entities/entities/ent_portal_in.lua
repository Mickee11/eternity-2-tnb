AddCSLuaFile()
DEFINE_BASECLASS("ent_baseportal")

ENT.Base 			= "ent_baseportal"
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT

ENT.PrintName 		= "Portal (Entrance)"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(255, 136, 0)

ENT.ExitType 		= "ent_portal_out"

ENT.LightParams 	= {
	r = 255,
	g = 136,
	b = 0
}

function ENT:Initialize()
	BaseClass.Initialize(self)

	self.Filter = {}
end

if SERVER then
	function ENT:StartTouch(ent)
		if not self:IsReady() or self.Filter[ent] then
			return
		end

		local exits = table.Filter(ents.FindByClass(self.ExitType), function(_, exit)
			return exit:GetTeleportGroup() == self:GetTeleportGroup() and exit != self
		end)

		local exit = exits[math.random(1, #exits)]

		if not IsValid(exit) or ent:IsProtectedEntity() then
			return
		end

		if ent:IsVehicle() or ent:IsNPC() then
			return
		end

		ent:ForcePlayerDrop()

		if ent:IsPlayer() then
			local ang = exit:LocalToWorldAngles(self:WorldToLocalAngles(ent:EyeAngles()))

			ang.p = math.Clamp(math.NormalizeAngle(ang.p), -89, 89)
			ang.r = 0

			ent:SetPos(exit:WorldSpaceCenter())
			ent:SetAngles(ang)
			ent:SetEyeAngles(ang)

			ent:SetVelocity(-ent:GetVelocity())

			ent:ScreenFade(SCREENFADE.IN, self.Color, 0.5, 0)
		else
			local ang = exit:LocalToWorldAngles(self:WorldToLocalAngles(ent:GetAngles()))
			local rot = exit:LocalToWorldAngles(-self:GetAngles())

			local vel = ent:GetVelocity()

			vel:Rotate(rot)

			ent:SetPos(exit:WorldSpaceCenter())
			ent:SetAngles(ang)

			local phys = ent:GetPhysicsObject()

			if IsValid(phys) then
				phys:SetVelocity(vel)
			end
		end

		self:TeleportEffect()
		exit:TeleportEffect(ent)

		if exit.Filter then
			exit.Filter[ent] = true
		end
	end

	function ENT:EndTouch(ent)
		self.Filter[ent] = nil
	end
end
