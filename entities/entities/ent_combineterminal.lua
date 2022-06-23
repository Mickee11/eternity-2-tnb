AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Combine Terminal"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_combine/combine_interface001.mdl")

ENT.MenuOptions 	= {
	{Name = "Citizen Records", GUI = "RecordList", Callback = function(ply, ent) return ply:HasCombinePermission(COMBINE_RECORDS_READONLY) or ply:HasCombinePermission(COMBINE_RECORDS_WRITEABLE) end},
	{Name = "Surveillance System", GUI = "SurveillanceMenu", Callback = function(ply, ent) return ply:HasCombinePermission(COMBINE_SURVEILANCE_BASIC) or ply:HasCombinePermission(COMBINE_SURVEILANCE_UNITS) end},
	{Name = "Dispatch Access", GUI = "DispatchAccess", Callback = function(ply, ent) return ply:HasCombinePermission(COMBINE_ADMINS_DISPATCH) or ply:HasCombinePermission(COMBINE_ADMINS_WAIVER) end},
	{Name = "Unit Access Management", GUI = "UnitManagement", Callback = function(ply, ent) return ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE) end},
	{Name = "Unit Activity Management", GUI = "UnitActivity", Callback = function(ply, ent) return ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE) end},
	{Name = "Gear Requisitions", GUI = "GearRequisitions", Callback = function(ply, ent) return #GAMEMODE:GetPlayerRequisitionItems(ply) > 0 end}
}

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("Entity", 0, "Dummy")

	self:NetworkVar("Bool", 0, "AllowGear")
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not ply:IsInEditMode() or self:IsReady() or not interact then
		return tab
	end

	table.insert(tab, {
		EditModeOnly = true,
		Name = self:GetAllowGear() and "Disable Gear Requisitions" or "Enable Gear Requisitions",
		Callback = function()
			self:SetAllowGear(not self:GetAllowGear())
		end
	})

	return tab
end

function ENT:GetCustomData()
	return {
		AllowGear = self:GetAllowGear()
	}
end

function ENT:LoadCustomData(data)
	self:SetAllowGear(data.AllowGear)
end

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
	end
end

if SERVER then
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

		for _, v in pairs(self.MenuOptions) do
			if not v.Callback or v.Callback(ply, self) then
				ply:OpenGUI("TerminalMenu", self)

				return
			end
		end
	end
end