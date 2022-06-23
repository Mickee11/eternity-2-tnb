function EFFECT:Init(data)
	self.Ent = data:GetEntity()
	self.Color = data:GetStart()

	self.NextParticle = CurTime()
	self.StartTime = CurTime()
end

function EFFECT:Think()
	local ent = self.Ent

	if not IsValid(ent) then
		return false
	end

	if self.NextParticle <= CurTime() then
		local pos = ent:WorldSpaceCenter()
		local emitter = ParticleEmitter(pos)

		local particle = emitter:Add("particle/smokesprites_000" .. math.random(1, 9), pos)

		particle:SetRoll(math.Rand(0, 360))
		particle:SetRollDelta(math.Rand(-1, 1))

		particle:SetDieTime(math.random(7, 12))

		particle:SetStartAlpha(255)
		particle:SetEndAlpha(0)

		particle:SetStartSize(math.random(13, 15))
		particle:SetEndSize(math.random(280, 300))

		particle:SetColor(self.Color.r, self.Color.g, self.Color.b)

		particle:SetVelocity(ent:GetForward() * -65)
		particle:SetAirResistance(100)

		particle:SetGravity(VectorRand():GetNormalized() * math.random(45, 111) + Vector(0, math.random(55, 155), math.random(45, 55)))

		particle:SetCollide(false)
        
		particle:SetNextThink(1)
		particle:SetThinkFunction(function(pa)
			local dist = pa:GetPos():DistToSqr(LocalPlayer():GetPos())

			if dist < 10000 then
				if LocalPlayer().EntityGasGrenadeThink and LocalPlayer().EntityGasGrenadeThink > CurTime() then
					pa:SetNextThink(1)
				else
					netstream.Send("consciousness.PlayerTakeClientsideCDamage", { 
						Amount = 5,
						Type = CONSCIOUSNESS_HURT_GAS
					})

					LocalPlayer().EntityGasGrenadeThink = CurTime() + 1
				end
			end

            pa:SetNextThink(1)
        end)

		emitter:Finish()

		self.NextParticle = CurTime() + 0.1
	end

	return true
end

function EFFECT:Render()
end