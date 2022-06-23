AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_BOTH

ENT.PrintName 		= "Teleport: Target"
ENT.Category 		= "Eternity.Zone Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/editor/playerstart.mdl")

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_BBOX)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_BBOX)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end
	end

	self:DrawShadow(false)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)

	self:SetSubMaterial(0, "models/shiny")
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("String", 0, "ZoneID")
end

function ENT:Think()
	self:SetColor(Color(255, 223, 127))

	self:RemoveAllDecals()
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
				Default = self:GetZoneID(),
				Max = 30
			})
		end,
		Callback = function(val)
			if not GAMEMODE:CheckInput("string", {
				Max = 30
			}, val) then
				return
			end

			self:SetZoneID(val)
		end
    })
    
	return tab
end

if CLIENT then
	function ENT:Draw()
		if LocalPlayer():IsInEditMode() then
			self:DrawModel()

			if self:GetZoneID() != "" then
				GAMEMODE:DrawWorldText(self:GetPos() + Vector(0, 0, 80), "Teleport Group: " .. self:GetZoneID())
            end

			return
		end

		if not self:IsReady() then
			self:DrawModel()

			return
		end

		if GAMEMODE:GetSetting("ui_showspawns") then
			local alpha = math.ClampedRemap(self:GetPos():Distance(LocalPlayer():GetPos()), 500, 100, 0, 0.2)

			if alpha > 0 then
				render.SetBlend(alpha)
				self:DrawModel()
				render.SetBlend(1)
			end
		end
	end
end

if SERVER then
	function ENT:OnInitialLoad()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	end

	function ENT:IsSuitable(ply, zoneid)
		local pos = self:GetPos()
		local tab = ents.FindInBox(pos + Vector(-16, -16, 0), pos + Vector(16, 16, 72))

        if self:GetZoneID() ~= zoneid then
            return false
        end

		for _, v in pairs(tab) do
			if IsValid(v) and v:IsPlayer() and v:Alive() and v != ply then
				return false
			end
		end

		return true
	end

	function ENT:GetCustomData()
		return {
			ZoneID = self:GetZoneID()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetZoneID(data.ZoneID or "")
	end
end