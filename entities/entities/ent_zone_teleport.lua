AddCSLuaFile()
DEFINE_BASECLASS("ent_zone")

ENT.Base 			= "ent_zone"

ENT.PrintName 		= "Teleport: Trigger"
ENT.Category 		= "Eternity.Zone Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(255, 223, 127)

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("String", 0, "ZoneID")

	self:NetworkVar("Vector", 0, "ZoneMins")
	self:NetworkVar("Vector", 1, "ZoneMaxs")
end

function ENT:Enter(ply, transition)
	if CLIENT then
		return
	end

	if SERVER and not transition then
		local spawns = ents.FindByClass("ent_teletarget")

		if #spawns == 0 then
			return
		end

		for k,v in RandomPairs(spawns) do
			if not v:IsReady() then
				spawns[k] = nil
			elseif self:GetZoneID() ~= v:GetZoneID() then
				spawns[k] = nil
			end
		end

		local suitable = nil

		for _,v in RandomPairs(spawns) do
			if IsValid(v) and v:IsSuitable(ply, self:GetZoneID()) then
				suitable = v

				break
			end
		end

		if suitable == nil then
			suitable = spawns[1]
		end

		if suitable then
			ply:SetPos(suitable:GetPos())
			ply:SetAngles(suitable:GetAngles())

			ply:SetVelocity(ply:GetVelocity() * Vector(-1, -1, -1))
			ply:SetEyeAngles(suitable:GetAngles())
		end
	end
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not interact or not ply:IsInEditMode() then
		return tab
	end

	if self:CanSave() then
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
	end

	return tab
end

if CLIENT then
	function ENT:Draw()
		local edit = LocalPlayer():IsInEditMode()
		local ready = self:IsReady()

		if edit or not ready then
			self:DrawModel()

			local mins = self:OBBMins() - Vector(0.1, 0.1, 0.1)
			local maxs = self:OBBMaxs() + Vector(0.1, 0.1, 0.1)

			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetAngles(), mins, maxs, ColorAlpha(self.Color, 50), true)

			local weapon = LocalPlayer():GetActiveWeapon()

			if edit and IsValid(weapon) and weapon:GetClass() == "eternity_admin_zonemarker" then
				mins = self:GetZoneMins()
				maxs = self:GetZoneMaxs()

				local center = LerpVector(0.5, mins, maxs)

				mins = mins - center
				maxs = maxs - center

				render.SetColorMaterial()
				render.DrawBox(center, Angle(), mins, maxs, ColorAlpha(self.Color, 50))
				render.DrawWireframeBox(center, Angle(), mins, maxs, ColorAlpha(self.Color, 50))
				render.DrawLine(self:WorldSpaceCenter(), center, self.Color)
			end
		end

		if edit and ready then
			GAMEMODE:DrawWorldText(self:WorldSpaceCenter(), string.format("%s: %s (%s)", self.PrintName, self:GetZoneID(), self:GetZOrder()), true)
		end
	end
end

if SERVER then
	function ENT:GetCustomData()
		return {
			ZoneID = self:GetZoneID(),

			ZoneMins = self:GetZoneMins(),
			ZoneMaxs = self:GetZoneMaxs()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetZoneID(data.ZoneID)

		self:SetZoneMins(data.ZoneMins)
		self:SetZoneMaxs(data.ZoneMaxs)
	end
end
