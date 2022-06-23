local heightOffset = Vector(0, 0, 7500)

function EFFECT:Init(data)
	self.Origin = data:GetOrigin()
	self.Entity = data:GetEntity()

	self.Radius = data:GetRadius()

	self.NextParticle = CurTime()
	self.StartTime = CurTime()

	self.RampUp = 2
	self.RampDown = 1

	self.Event = timedEvent.New(128)

	self.Roll = math.random(0, 360)

	self:SetRenderBounds(Vector(-self.Radius, -self.Radius, 0), Vector(self.Radius, self.Radius, heightOffset))

	-- Runtime vars
	self.Perc = 0
	self.Ending = false
end

function EFFECT:GetStartPerc()
	local val = math.ClampedRemap(CurTime(), self.StartTime, self.StartTime + self.RampUp, 0, 1)

	return math.Gain(val, 0.2)
end

function EFFECT:GetEndPerc()
	local val = math.ClampedRemap(CurTime(), self.StartTime + self.RampUp, self.StartTime + self.RampUp + self.RampDown, 1, 0)

	return math.Gain(val, 0.75)
end

function EFFECT:AddRisingParticles(perc)
	local radius = self.Radius * 0.25 * perc
	local val = math.ClampedRemap(CurTime(), self.StartTime, self.StartTime + self.RampUp, 0, 1)

	local emitter = ParticleEmitter(self.Origin)

	self.Event:While(FrameTime(), function()
		local r = radius * math.sqrt(math.random())
		local theta = math.random() * 2 * math.pi

		local offset = Vector(r * math.cos(theta), r * math.sin(theta), math.Rand(-8, 8))
		local p = emitter:Add("effects/spark", self.Origin + offset)

		p:SetDieTime(math.Rand(0.5, 1))

		p:SetVelocity(Vector(math.Rand(-4, 4), math.Rand(-4, 4), math.Rand(32, 256) * math.Bias(val, 0.25)))

		p:SetStartSize(math.Rand(4, 8) * perc)
		p:SetEndSize(0)

		p:SetRoll(math.random(0, 360))

		local a = perc * 255

		p:SetRollDelta(math.Rand(-8 * perc, 8 * perc))

		p:SetColor(a, a, a)

		p:SetStartAlpha(a)
		p:SetEndAlpha(0)
	end)
end

function EFFECT:AddExplodingParticles(perc)
	local radius = 48 * perc
	local emitter = ParticleEmitter(self.Origin)

	self.Event:While(FrameTime(), function()
		local r = radius * math.sqrt(math.random())
		local theta = math.random() * 2 * math.pi

		local offset = Vector(r * math.cos(theta), r * math.sin(theta), math.Rand(-8, 8))
		local p = emitter:Add("effects/spark", self.Origin + offset)

		p:SetDieTime(math.Rand(0.25, 0.5))

		local vel = VectorRand(-1, 1) + Vector(0, 0, 1)

		p:SetVelocity(vel * (750 * perc))

		p:SetStartSize(math.Rand(2, 4) * perc)
		p:SetEndSize(0)

		p:SetRoll(math.random(0, 360))

		local a = perc * 255

		p:SetRollDelta(math.Rand(-8 * perc, 8 * perc))

		p:SetColor(a, a, a)

		p:SetStartAlpha(a)
		p:SetEndAlpha(0)
	end)
end

function EFFECT:Think()
	if CurTime() > self.StartTime + self.RampUp + self.RampDown then
		return false
	end

	if CurTime() < self.StartTime + self.RampUp then
		self.Perc = self:GetStartPerc()
		self.Ending = false
	else
		self.Perc = self:GetEndPerc()
		self.Ending = true
	end

	if not self.Ending then
		self:AddRisingParticles(self.Perc)
	else
		self:AddExplodingParticles(self.Perc)
	end

	return true
end

local impact = Material("effects/combinemuzzle2_nocull")
local beam = CreateMaterial("combine_laserbeam", "UnlitGeneric", {
	["$basetexture"] = "sprites/laserbeam",
	["$additive"] = 1,
	["$translucent"] = 1,
	["$vertexcolor"] = 1
})

local col = Color(32, 32, 16)

function EFFECT:Render()
	local alpha = self.Perc * 255
	local scale = self.Ending and self.Radius or (self.Radius * 0.1) + ((self.Radius - (self.Radius * 0.1)) * self.Perc)

	local normal = Vector(0, 0, 1)

	render.SetMaterial(impact)
	render.DrawQuadEasy(self.Origin + normal * 2, normal, scale, scale, Color(255, 255, 255, alpha), self.Roll)

	render.SetMaterial(beam)

	local mult = 0

	if not self.Ending then
		local time = (CurTime() - self.StartTime) / self.RampUp

		mult = math.Bias(math.Clamp(time, 0, 1), 0.1)
	else
		local time = (CurTime() - (self.StartTime + self.RampUp)) / self.RampDown

		mult = math.Bias(math.Clamp(1 - time, 0, 1), 0.25)
	end

	local radius = math.Remap(self.Radius, 0, 350, 0, 35)
	local radius2 = math.Remap(self.Radius, 0, 350, 0, 8)

	render.StartBeam(2)
		render.AddBeam(self.Origin, radius * mult, 0, ColorAlpha(col, 255 * mult))
		render.AddBeam(self.Origin + heightOffset, radius * mult, 1, ColorAlpha(col, 255 * mult))
	render.EndBeam()

	render.StartBeam(2)
		render.AddBeam(self.Origin, radius2 * mult, 0, ColorAlpha(color_white, 255 * mult))
		render.AddBeam(self.Origin + heightOffset, radius2 * mult, 1, ColorAlpha(color_white, 255 * mult))
	render.EndBeam()
end
