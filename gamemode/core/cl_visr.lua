local npc = Color(0, 128, 128)
local overlay = Material("effects/combine_binocoverlay")

function GM:GetVISREntities(ent)
	if ent:IsNPC() and ent:Health() > 0 then
		local tab = {ent}
		local weapon = ent.GetActiveWeapon and ent:GetActiveWeapon() or false

		if IsValid(weapon) then
			table.insert(tab, weapon)
		end

		return tab, npc
	elseif ent:IsPlayer() and ent:Alive() then
		local ragdoll = ent:GetRagdoll()
		local color = GAMEMODE:GetTeamColor(ent)

		if IsValid(ragdoll) then
			return {ragdoll}, color
		end

		local vehicle = ent:GetVehicle()

		if IsValid(vehicle) then
			local lfs = vehicle.LFSBaseEnt
			local wac = vehicle.wac_seatswitcher
			local simfphys = vehicle.SPHYSBaseEnt

			local driver = not ent:GetNoDraw() and ent or nil

			if IsValid(lfs) and lfs:GetDriver() == ent then
				return {lfs, driver}, color
			elseif IsValid(wac) and wac:GetParent():getPassenger(1) == ent then
				local parent = wac:GetParent()

				return {parent, driver, parent:GetNWEntity("wac_air_rotor_main"), parent:GetNWEntity("rotor_rear")}, color
			elseif IsValid(simfphys) and simfphys:GetDriver() == ent then
				return {simfphys, driver}, color
			else
				return {vehicle, driver}, color
			end
		end

		if ent:GetNoDraw() then
			return false
		end

		local tab = {ent}
		local weapon = ent:GetActiveWeapon()

		if IsValid(weapon) then
			table.insert(tab, weapon)
		end

		return tab, color
	end

	return false
end

local NVGScale = 0

hook.Add("PlayerVISRChanged", "visr.PlayerVISRChanged", function (ply, old, new)
	if ply != LocalPlayer() then
		return
	end

	NVGScale = 0
end)

local function createLight()
	local light = ProjectedTexture()

	light:SetTexture("effects/flashlight001")
	light:SetFarZ(1000)
	light:SetEnableShadows(false)

	VISRLight = light
end

hook.Add("RenderScreenspaceEffects", "visr.RenderScreenspaceEffects", function()
	if not LocalPlayer():VISR() then
		if IsValid(VISRLight) then
			VISRLight:Remove()
			VISRLight = nil
		end

		return
	end

	if not VISRLight then
		createLight()
	end

	if NVGScale < 1 then
		NVGScale = NVGScale + ((1 - NVGScale) * FrameTime())
	else
		NVGScale = 1
	end

	VISRLight:SetBrightness(1.2 - NVGScale)

	VISRLight:SetPos(EyePos())
	VISRLight:SetAngles(EyeAngles())
	VISRLight:Update()

	DrawColorModify({
		["$pp_colour_addr"] = 0.05,
		["$pp_colour_addg"] = 0.15,
		["$pp_colour_addb"] = 0.15,
		["$pp_colour_contrast"] = 1,
		["$pp_colour_brightness"] = -0.125,
		["$pp_colour_colour"] = 0,
		["$pp_colour_mulr"] = 0,
		["$pp_colour_mulg"] = 0,
		["$pp_colour_mulb"] = 0
	})

	render.UpdateScreenEffectTexture()

	overlay:SetFloat( "$envmap", 0 )
	overlay:SetFloat( "$envmaptint", 0 )
	overlay:SetFloat( "$refractamount", 0 )
	overlay:SetInt( "$ignorez", 1 )

	render.SetMaterial( overlay )
	render.DrawScreenQuad( true )
end)

hook.Add("PreDrawOutlines", "visr.PreDrawHUD", function()
	if not LocalPlayer():VISR() then
		return
	end

	if LocalPlayer():GetActiveSpecies().Team == TEAM_OVERWATCH then
		local tab = {}

		table.Add(tab, team.GetPlayers(TEAM_OVERWATCH))
		table.Add(tab, team.GetPlayers(TEAM_POLICE))
		table.Add(tab, team.GetPlayers(TEAM_COMBINEADMIN))
		table.Add(tab, team.GetPlayers(TEAM_INSPECTORS))
		table.Add(tab, ents.FindByClass("npc_*"))

		for _, v in pairs(tab) do
			if not IsValid(v) then
				continue
			end

			if v:IsDormant() then
				continue
			end

			if v:IsPlayer() and v:HasCloak() then
				continue
			end

			local entities, color = GAMEMODE:GetVISREntities(v)

			if not entities then
				continue
			end

			for _, ent in pairs(entities) do
				local parts = part.Get(ent)

				if parts then
					for _, data in pairs(parts) do
						if IsValid(data.Ent) then
							table.insert(entities, data.Ent)
						end
					end
				end
			end

			outline.Add(entities, color, OUTLINE_MODE_VISIBLE)
		end
	end
end)
