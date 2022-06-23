AddCSLuaFile()
DEFINE_BASECLASS("ent_zone")

ENT.Base 			= "ent_zone"

ENT.PrintName 		= "Transition: Trigger"
ENT.Category 		= "Eternity.Zone Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Color 			= Color(255, 127, 223)

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")
	self:NetworkVar("Int", 1, "Transition")

	self:NetworkVar("String", 0, "HintText")
	self:NetworkVar("String", 1, "SpawnGroup")
	self:NetworkVar("String", 2, "AreaName")
	self:NetworkVar("String", 3, "ServerAddress")

	self:NetworkVar("Vector", 0, "ZoneMins")
	self:NetworkVar("Vector", 1, "ZoneMaxs")
end

function ENT:Enter(ply, transition)
	if CLIENT and ply == LocalPlayer() and not transition then
		local text = self:GetHintText()

		if text == nil or text == "" then
			text = "Use the context menu to change your character's server."
		end

		Derma_Query(text, string.format("Server Transition: %s", WORLDAREAS[self:GetTransition()].Fancy),
		"Don't Change", function() return end,
		"Change Servers", function()
			netstream.Send("RequestServerTransition", {
				Zone = self:GetEntityID()
			})
		end)
	end

	if SERVER and not transition then
		local text = self:GetHintText()

		if text ~= nil and text ~= "" then
			ply:SendChat("NOTICE", text)
		else
			text = "Use the context menu to change your character's server."
		end

		ply:SendChat("NOTICE", "Use the context menu to change your character's server.")
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
			Name = "Set Hint Text",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Hint Text", {
					Default = self:GetHintText(),
					Max = 128
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 128
				}, val) then
					return
				end

				self:SetHintText(val)
			end
		})

		table.insert(tab, {
			EditModeOnly = true,
			Name = "Set Spawngroup",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Spawngroup", {
					Default = self:GetSpawnGroup(),
					Max = 32
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 32
				}, val) then
					return
				end

				self:SetSpawnGroup(val)
			end
		})

		table.insert(tab, {
			EditModeOnly = true,
			Name = "Set Context Name",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Context Name", {
					Default = self:GetAreaName(),
					Max = 32
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 32
				}, val) then
					return
				end

				self:SetAreaName(val)
			end
		})

		--[[table.insert(tab, {
			EditModeOnly = true,
			Name = "Set Server Address",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Server Address", {
					Default = self:GetServerAddress(),
					Max = 32
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 32
				}, val) then
					return
				end

				self:SetServerAddress(val)
			end
		})]]

		for k,v in pairs(WORLDAREAS) do
			table.insert(tab, {
				EditModeOnly = true,
				Name = "Set Transition Type: " .. v.Fancy,
				Callback = function()
					self:SetTransition(k)
				end
			})
		end
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
			GAMEMODE:DrawWorldText(self:WorldSpaceCenter(), string.format("%s: %s, %s (%s)", self.PrintName, self:GetSpawnGroup(), WORLDAREAS[self:GetTransition()].Fancy, self:GetZOrder()), true)
		end
	end
end

if SERVER then
	function ENT:GetCustomData()
		return {
			Transition = self:GetTransition(),

			HintText = self:GetHintText(),
			SpawnGroup = self:GetSpawnGroup(),
			AreaName = self:GetAreaName(),
			ServerAddress = self:GetServerAddress(),

			ZoneMins = self:GetZoneMins(),
			ZoneMaxs = self:GetZoneMaxs()
		}
	end

	function ENT:LoadCustomData(data)
		self:SetTransition(data.Transition)

		self:SetHintText(data.HintText)
		self:SetSpawnGroup(data.SpawnGroup)
		self:SetAreaName(data.AreaName)
		self:SetServerAddress(data.ServerAddress)

		self:SetZoneMins(data.ZoneMins)
		self:SetZoneMaxs(data.ZoneMaxs)
	end
end
