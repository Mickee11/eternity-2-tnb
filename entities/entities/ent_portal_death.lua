AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent") -- Don't do this unless you know what you're doing

ENT.Base 			= "ent_baseportal"
ENT.RenderGroup 	= RENDERGROUP_TRANSLUCENT

ENT.PrintName 		= "Portal (Death)"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(255, 80, 80)

ENT.Mins 			= Vector(-40, -40, -50)
ENT.Maxs 			= Vector(40, 40, 40)

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
end

function ENT:CanSave()
	return true
end

function ENT:GetContextOptions(ply, interact)
	return BaseClass.GetContextOptions(self, ply, interact)
end

if CLIENT then
	local mat = CreateMaterial("portal_death", "UnlitTwoTexture", {
		["$basetexture"] = "models/effects/vortshield_color",
		["$texture2"] = "models/effects/vortshield_base",
		["$model"] = 1,
		["$nocull"] = 1,
		["$additive"] = 1,
		["Proxies"] = {
			["TextureScroll"] = {
				["texturescrollvar"] = "$texture2transform",
				["texturescrollrate"] = -0.1,
				["texturescrollangle"] = 0
			}
		}
	})

	local col = Color(0, 0, 0)

	function ENT:OnRemove()
		if self.Sound then
			self.Sound:Stop()
		end
	end

	local matrix = Matrix()

	matrix:SetScale(Vector(2, 2, 2))

	function ENT:Think()
		local light = DynamicLight(self:EntIndex())

		if light then
			light.pos = self:GetPos()
			light.r = 255
			light.g = 32
			light.b = 32
			light.brightness = 2
			light.Decay = 1000
			light.Size = 256
			light.DieTime = CurTime() + 1
		end

		if not self.Sound then
			self.Sound = CreateSound(self, "ambient/levels/citadel/citadel_drone_loop2.wav")
			self.Sound:ChangePitch(0.2)
			self.Sound:SetSoundLevel(75)
		end

		if not self.Sound:IsPlaying() then
			self.Sound:Play()
		end

		self:EnableMatrix("RenderMultiply", matrix)
	end

	function ENT:DrawTranslucent()
		local edit = LocalPlayer():IsInEditMode()

		render.SetColorMaterial()

		if edit then
			local mins = self.Mins - Vector(0.1, 0.1, 0.1)
			local maxs = self.Maxs + Vector(0.1, 0.1, 0.1)

			local color = ColorAlpha(self.Color, 50)

			render.DrawBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)
			render.DrawWireframeBox(self:GetPos(), self:GetNetworkAngles(), mins, maxs, color, true)
		end

		render.DrawSphere(self:GetPos(), 5, 20, 20, col)

		local ang = (EyePos() - self:GetPos()):Angle()

		render.MaterialOverride(mat)

		self:SetRenderAngles(ang)
		self:SetupBones()
		self:DrawModel()
		self:DrawModel()

		render.MaterialOverride()

		local size = math.sin(CurTime() * 10) * 2 + 110

		render.SetMaterial(Material("models/effects/comball_glow1"))
		render.DrawSprite(self:GetPos(), size, size)
	end
else
	function ENT:TeleportEffect()
		self:EmitSound("beams/beamstart5.wav", 75, 100, 0.5)
	end

	function ENT:GetCustomData()
		return {}
	end

	function ENT:LoadCustomData(data)
	end
end

if SERVER then
	function ENT:StartTouch(ent)
		if not self:IsReady() then
			return
		end

		if ent:IsVehicle() or ent:IsNPC() then
			return
		end

		ent:ForcePlayerDrop()

		if ent:IsPlayer() then
			ent:SetPos(self:WorldSpaceCenter())
			ent:KillSilent()
			ent:ScreenFade(SCREENFADE.IN, Color(255, 0, 0), 2.5, 0)

			self:EmitSound("npc/stalker/go_alert2.wav", 140, 40, 1)
		else
			ent:Remove()
		end

		self:TeleportEffect()
	end
end
