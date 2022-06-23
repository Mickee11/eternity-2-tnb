AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 				= "ent_worldent"
ENT.RenderGroup 		= RENDERGROUP_TRANSLUCENT

ENT.Spawnable 			= false
ENT.AdminOnly 			= false

ENT.Model 				= Model("models/effects/intro_vortshield.mdl")
ENT.Color 				= color_white

ENT.Mins 				= Vector(-25, -25, -25)
ENT.Maxs 				= Vector(25, 25, 25)

ENT.LightParams 		= {
	brightness = 2,
	Decay = 1000,
	Size = 128
}

function ENT:Initialize()
	self:SetModel(self.Model)
	self:SetColor(self.Color)

	self:DrawShadow(false)

	if SERVER then
		self:PhysicsInitBox(self.Mins, self.Maxs)
		self:SetMoveType(MOVETYPE_NONE)

		self:SetTrigger(true)
	end

	self:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("String", 0, "TeleportGroup")
end

function ENT:CanSave()
	return self:GetTeleportGroup() != ""
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

	table.insert(tab, {
		EditModeOnly = true,
		Name = "Set Teleport Group",
		Client = function()
			return GAMEMODE:OpenGUI("Input", "string", "Set Teleport Group", {
				Default = self:GetTeleportGroup(),
				Max = 30
			})
		end,
		Callback = function(val)
			if not GAMEMODE:CheckInput("string", {
				Max = 30
			}, val) then
				return
			end

			self:SetTeleportGroup(val)
		end
	})

	return tab
end

if CLIENT then
	local range = 1024 * 1024

	function ENT:ShouldDoLight()
		return not self:IsDormant() and EyePos():DistToSqr(self:GetPos()) < range
	end

	function ENT:Think()
		if self:ShouldDoLight() then
			local light = DynamicLight(self:EntIndex())

			if light then
				light.pos = self:GetPos()
				light.DieTime = CurTime() + 1

				for k, v in pairs(self.LightParams) do
					if istable(v) then
						continue
					end

					light[k] = v
				end
			end
		end
	end

	function ENT:DrawTranslucent()
		local edit = LocalPlayer():IsInEditMode()

		if edit then
			local mins = self.Mins - Vector(0.1, 0.1, 0.1)
			local maxs = self.Maxs + Vector(0.1, 0.1, 0.1)

			local color = ColorAlpha(self.Color, 50)

			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)
			render.DrawWireframeBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)

			render.DrawLine(self:GetPos(), self:GetPos() + self:GetForward() * 50, self.Color, true)

			if self:GetTeleportGroup() != "" then
				GAMEMODE:DrawWorldText(self:GetPos() + Vector(0, 0, 25), self:GetTeleportGroup())
			end
		end

		local ang = (EyePos() - self:GetPos()):Angle()

		self:SetRenderAngles(ang)
		self:SetupBones()
		self:DrawModel()
		self:DrawModel()
	end
else
	function ENT:TeleportEffect(ent)
		if not ent then
			ent = self
		end

		ent:EmitSound("beams/beamstart5.wav", 75, 100, 0.5)
	end

	function ENT:GetCustomData()
		return {
			Group = self:GetTeleportGroup()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetTeleportGroup(data.Group)
	end
end
