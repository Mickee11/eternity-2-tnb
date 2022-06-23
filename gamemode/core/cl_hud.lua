local meta = FindMetaTable( "Player" )

GM.HUDCache = {}

-- Yes, I really imported this shit from base CombineControl.
GM.WeaponSelectEngineNames = { }
GM.WeaponSelectEngineNames["weapon_physgun"] = "Physics Gun"
GM.WeaponSelectEngineNames["weapon_physcannon"] = "Gravity Gun"

GM.WeaponSlotOverrides = { }
GM.WeaponSlotOverrides["weapon_physgun"] = {3, 1}
GM.WeaponSlotOverrides["gmod_tool"] = {3, 2}
GM.WeaponSlotOverrides["weapon_physcannon"] = {3, 3}
GM.WeaponSlotOverrides["eternity_admin_zonemarker"] = {3, 4}
GM.WeaponSlotOverrides["eternity_admin_combinemortar"] = {3, 5}
GM.WeaponSlotOverrides["weapon_possessor"] = {3, 5}

GM.WeaponSelectOpenTime = 2
GM.WeaponSelectWidth = 250
GM.WeaponSelectRef = GM.WeaponSelectOpenTime * -1
GM.WeaponSelectSlot = 1
GM.WeaponSelectSlotPos = 1

language.Add("npc_clawscanner", "Claw Scanner")
language.Add("npc_combine_camera", "Combine Camera")
language.Add("npc_helicopter", "Helicopter")
language.Add("npc_fisherman", "Fisherman")

local matBlurScreen = Material("pp/blurscreen")

function GM:WeaponSelectGetPrintName(weapon)
	if weapon.PrintName then
		return weapon.PrintName
	end

	if self.WeaponSelectEngineNames[weapon:GetClass()] then
		return self.WeaponSelectEngineNames[weapon:GetClass()]
	end

	return weapon:GetClass()
end

function GM:WeaponSelectGetSlot(weapon)
	if self.WeaponSlotOverrides[weapon:GetClass()] then
		return self.WeaponSlotOverrides[weapon:GetClass()][1]
	end

	if weapon.Slot then
		return weapon.Slot
	end

	return 3
end

hook.Add("PlayerBindPress", "hud.PlayerBindPress", function(ply, bind, down)
	if down and string.find(bind, "invnext") and not LocalPlayer():KeyDown(IN_ATTACK) and not LocalPlayer():KeyDown(IN_ATTACK2) and not LocalPlayer():Restrained() and not LocalPlayer():InVehicle() and LocalPlayer():Alive() then
		GAMEMODE:WeaponSelectScrollDown()

		return true
	end

	if down and string.find( bind, "invprev" ) and not LocalPlayer():KeyDown(IN_ATTACK) and not LocalPlayer():KeyDown(IN_ATTACK2) and not LocalPlayer():Restrained() and not LocalPlayer():InVehicle() and LocalPlayer():Alive() then
		GAMEMODE:WeaponSelectScrollUp()

		return true
	end

	if down and string.find( bind, "attack" ) and GAMEMODE:WeaponSelectOpen() and not LocalPlayer():KeyDown(IN_ATTACK) and not LocalPlayer():KeyDown(IN_ATTACK2) and not LocalPlayer():Restrained() and not LocalPlayer():InVehicle() and LocalPlayer():Alive() then
		GAMEMODE:WeaponSelectClick()

		return true
	end

	if down and string.StartWith(bind, "slot") and not LocalPlayer():Restrained() and not LocalPlayer():InVehicle() and LocalPlayer():Alive() then
		local a, _ = string.gsub(bind, "slot", "")
		local n = tonumber(a)

		if n == 1 or n == 2 or n == 3 then
			GAMEMODE:WeaponSelectNumber(n)
		end

		return true
	end
end)

function draw.BackgroundBlur(frac)
	DisableClipping(true)

	surface.SetMaterial(matBlurScreen)
	surface.SetDrawColor(255, 255, 255, 255)

	for i = 1, 3 do
		matBlurScreen:SetFloat("$blur", frac * 5 * (i / 3))
		matBlurScreen:Recompute()

		render.UpdateScreenEffectTexture()
		surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
	end

	DisableClipping(false)
end

function GM:IsFirstPerson()
	local lp = LocalPlayer()

	if lp:GetViewEntity() != lp then
		return false
	end

	return not ctp:IsEnabled()
end

GM.WorldLabels = {}

function GM:DrawWorldLabels()
	local colors = GAMEMODE:GetConfig("UIColors")
	local lpos = EyePos()

	table.sort(self.WorldLabels, function(a, b)
		return a.Pos:DistToSqr(lpos) > b.Pos:DistToSqr(lpos)
	end)

	for _, v in ipairs(self.WorldLabels) do
		local w, h = v.Text:GetSize()

		if self:GetSetting("ui_worldlabels") then
			surface.SetDrawColor(ColorAlpha(colors.FillDark, 230 * v.Fraction))
			surface.DrawRect(v.x - (w * 0.5) - 1, v.y - h + v.Offset, w + 2, h)
		end

		v.Text:Draw(v.x, v.y - h + v.Offset, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 255 * v.Fraction)
	end

	table.Empty(self.WorldLabels)
end

hook.Add("HUDPaintBackground", "hud.HUDPaintBackground", function()
	if GAMEMODE:GetSetting("hud_enabled") then
		if GAMEMODE:GetSetting("hud_weaponselect") then
			GAMEMODE:DrawWeaponSelect()
		end

		local colors = GAMEMODE:GetConfig("UIColors")
		local config = GAMEMODE:GetConfig("HUDData")
		local cache = GAMEMODE.HUDCache

		GAMEMODE:HandleHUDCache(config, cache)

		for _, v in pairs(GAMEMODE.BackgroundHUDSections) do
			if not v.Setting or GAMEMODE:HUDEnabled(v.Setting, v.Editmode) then
				v.Callback(colors, config)
			end
		end

		GAMEMODE:DrawWorldLabels()
	end
end)

hook.Add("HUDPaint", "hud.HUDPaint", function()
	if GAMEMODE:GetSetting("hud_enabled") then
		if GAMEMODE:GetSetting("hud_weaponselect") then
			GAMEMODE:DrawWeaponSelect()
		end

		local colors = GAMEMODE:GetConfig("UIColors")
		local config = GAMEMODE:GetConfig("HUDData")
		local cache = GAMEMODE.HUDCache

		for _, v in pairs(GAMEMODE.HUDSections) do
			if not v.Setting or GAMEMODE:HUDEnabled(v.Setting, v.Editmode) then
				v.Callback(colors, config, cache)
			end
		end
	end

	local ply = LocalPlayer()
	local val = ply:Consciousness()
	local ragdoll = ply:GetRagdoll()
	local fraction = val / 75

	local colors = GAMEMODE:GetConfig("UIColors")

	if IsValid(ragdoll) or val == 0 then
		draw.BackgroundBlur(1)

		local text = ply:Alive() and "You've been knocked out." or "You've died."
		local w = ScrW() / 2
		local h = ScrH() / 2

		draw.DrawText(text, "eternity.labelgiant", w, ScrH() / 2, colors.TextNormal, 1)

		surface.SetDrawColor(ColorAlpha(colors.FillDark, 150))
		surface.DrawRect(w - 200, ScrH() / 2 + 40, 400, 40)

		surface.SetDrawColor(ColorAlpha(colors.Border, 100))
		surface.DrawOutlinedRect(w - 200, h + 40, 400, 40)

		surface.SetDrawColor(colors.Primary)
		surface.DrawRect(w - 200 + 1, h + 40 + 1, (400 - 2) * math.min(val / 100, 1), 40 - 2)

		local progress = (IsValid(ragdoll) and ragdoll:GetVelocity():Length() > 15) and "You're being moved." or string.format("%s%%", val)

		draw.DrawText(progress, "eternity.labelbig", w, h + 1 + 40 + draw.GetFontHeight("eternity.labelbig") / 2, colors.TextNormal, 1)
	elseif fraction < 1 then
		draw.BackgroundBlur(1 - fraction)
	end
end)

hook.Add("Think", "hud.Think", function()
	local setting = GAMEMODE:GetSetting("hud_thirdperson")

	if setting != ctp:IsEnabled() then
		ctp:Toggle()
	end
end)

GM.DisabledHUDElements = {
	["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudChat"] = true,
	["CHudHistoryResource"] = true,
	["CHUDAutoAim"] = true,
	["CHudDamageIndicator"] = true,
	["CHudWeaponSelection"] = true
}

GM.BackgroundHUDSections = {}
GM.HUDSections = {}

function GM:RegisterHUDSection(setting, callback, editmode)
	table.insert(self.HUDSections, {
		Setting = setting,
		Callback = callback,
		Editmode = editmode or false
	})
end

function GM:RegisterBackgroundHUDSection(setting, callback, editmode)
	table.insert(self.BackgroundHUDSections, {
		Setting = setting,
		Callback = callback,
		Editmode = editmode or false
	})
end

function GM:DrawHUDBox(text, x, y, horizontal, vertical, colors, config)
	local w, h = text:GetSize()
	local margin = config.Margin * 2

	surface.SetDrawColor(ColorAlpha(colors.FillDark, 200))
	surface.DrawRect(x - config.Margin, y - config.Margin, w + margin, h + margin)

	text:Draw(x, y, horizontal, vertical)
end

function GM:HandleHUDCache(config, cache)
	cache.HP = cache.HP or 1
	cache.Hunger = cache.Hunger or 0
	cache.LeftOffset = config.Offset
	cache.RightOffset = config.Offset

	local eye = EyePos()

	for _, v in pairs(player.GetAll()) do
		v.HUDDistance = v:GetPos():DistToSqr(eye)

		if v == LocalPlayer() then
			continue
		end

		v.HUDAlpha = v.HUDAlpha or 0

		if v:GetNoDraw() then
			v.HUDAlpha = 0
		end

		if GAMEMODE:GetSetting("hud_legacy") then
			if not v.HUDSeen then
				v.HUDAlpha = math.Clamp(v.HUDAlpha - FrameTime(), 0, 1)
			end

			v.HUDSeen = false
		else
			v.HUDFade = v.HUDFade or 0

			if v.HUDFade < CurTime() then
				v.HUDAlpha = math.Clamp(v.HUDAlpha - FrameTime(), 0, 1)
			end
		end
	end
end

function GM:HUDEnabled(part, editmode)
	if not LocalPlayer():HasCharacter() then
		return false
	end

	if LocalPlayer():IsInCamera() then
		return false
	end

	if not part then
		return true
	end

	if editmode and LocalPlayer():IsInEditMode() then
		return true
	end

	return self:GetSetting("hud_enabled") and self:GetSetting("hud_" .. part) or false
end

function GM:DrawWorldText(pos, text, noz)
	local ang = (pos - EyePos()):Angle()

	cam.Start3D2D(pos, Angle(0, ang.y - 90, 90), 0.25)
		if noz then
			render.DepthRange(0, 0)
		end

		render.PushFilterMag(TEXFILTER.NONE)
		render.PushFilterMin(TEXFILTER.NONE)
			surface.SetFont("BudgetLabel")

			local w, h = surface.GetTextSize(text)

			surface.SetTextColor(255, 255, 255, 255)
			surface.SetTextPos(-w * 0.5, -h * 0.5)

			surface.DrawText(text)
		render.PopFilterMin()
		render.PopFilterMag()

		if noz then
			render.DepthRange(0, 1)
		end
	cam.End3D2D()
end

function GM:AddWorldLabel(text, pos, fraction, offset)
	local screen = pos:ToScreen()

	if not screen.visible then
		return
	end

	table.insert(self.WorldLabels, {
		Text = text,
		Pos = pos,
		x = math.Round(screen.x),
		y = math.Round(screen.y),
		Fraction = fraction,
		Offset = offset or 0
	})
end

function GM:DrawScaleText(text, x, y, color, font, scale)
	render.PushFilterMag(TEXFILTER.NONE)
	render.PushFilterMin(TEXFILTER.NONE)

	surface.SetFont(font)

	local w, h = surface.GetTextSize(text)

	w = w * scale
	h = h * scale

	x = x - (w / 2)
	y = y - (h / 2)

	local mat = Matrix()

	mat:SetScale(Vector(1, 1, 1) * scale)
	mat:SetTranslation(Vector(x, y, 0))

	cam.PushModelMatrix(mat)
		surface.SetTextPos(0, 0)
		surface.SetTextColor(color)
		surface.DrawText(text)
	cam.PopModelMatrix()

	render.PopFilterMag()
	render.PopFilterMin()
end

GM:RegisterHUDSection("sandbox", function(colors, config, cache)
	if LocalPlayer():InVehicle() then
		return
	end

	local weapon = LocalPlayer():GetActiveWeapon()

	if IsValid(weapon) and (weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool") then
		local str

		if LocalPlayer():IsAdmin() then
			str = string.format("<font=eternity.labelgiant><ol>Props: %s\nRagdolls: %s\nEffects: %s",
				LocalPlayer():GetCount("props"),
				LocalPlayer():GetCount("ragdolls"),
				LocalPlayer():GetCount("effects")
			)
		else
			str = string.format("<font=eternity.labelgiant><ol>Props: %s/%s\nRagdolls: %s/%s\nEffects: %s/%s",
				LocalPlayer():GetCount("props"), LocalPlayer():GetSandboxLimit("props"),
				LocalPlayer():GetCount("ragdolls"), LocalPlayer():GetSandboxLimit("ragdolls"),
				LocalPlayer():GetCount("effects"), LocalPlayer():GetSandboxLimit("effects")
			)
		end

		local text = markleft.Parse(str)

		local x = ScrW() - config.Offset - text:GetWidth()
		local y = ScrH() - config.Offset - text:GetHeight() * 1.825

		GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)

		str = "<font=eternity.labelgiant>Either your Physics Gun or Tool Gun is visible on your character!\nYou will be considered out-of-character until they are put away!"

		text = markleft.Parse(str)

		x = ScrW() - config.Offset - text:GetWidth()
		y = ScrH() - config.Offset - text:GetHeight()

		GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)
	end
end)

GM:RegisterHUDSection("ammo", function(colors, config, cache)
	if LocalPlayer():InVehicle() then
		return
	end

	local weapon = LocalPlayer():GetActiveWeapon()

	if IsValid(weapon) and weapon.Base == "eternity_firearm_base" then
		local str = weapon:GetFiremode()

		if not str then
			return
		end

		str = str:GetAmmoDisplay()

		if not str then
			return
		end

		local text = markleft.Parse(str)

		local x = ScrW() - config.Offset - text:GetWidth()
		local y = ScrH() - cache.RightOffset - text:GetHeight()

		GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)

		cache.RightOffset = cache.RightOffset + text:GetHeight() + (config.Margin * 2)
	end
end)

GM:RegisterHUDSection("firemode", function(colors, config, cache)
	if LocalPlayer():InVehicle() then
		return
	end

	local weapon = LocalPlayer():GetActiveWeapon()

	if IsValid(weapon) and weapon.Base == "eternity_firearm_base" and weapon:GetFiremode() then
		local str = weapon:GetFiremode():GetFiremodeDisplay()

		if not str then
			return
		end

		local text = markleft.Parse(str)

		local x = ScrW() - config.Offset - text:GetWidth()
		local y = ScrH() - cache.RightOffset - text:GetHeight()

		GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)
	end
end)

GM:RegisterHUDSection("infobox", function(colors, config, cache)
	local money = 0
	local currency = class.Get(GAMEMODE:GetConfig("DefaultCurrency"))

	if not LocalPlayer():GetInventory("Main") then
		money = string.format(currency.PluralName, 0)
	else
		money = LocalPlayer():GetMoney()

		if money == 1 then
			money = string.format(currency.SingularName, money)
		else
			money = string.format(currency.PluralName, money)
		end
	end

	local str = string.format("<font=eternity.labelgiant><ol>%s\n%s\nCID #%s", LocalPlayer():VisibleRPName(), money, LocalPlayer():VisibleCitizenNumber())
	local text = markleft.Parse(str)

	text.Width = math.Max(text:GetWidth(), 220)

	local x = config.Offset
	local y = ScrH() - cache.LeftOffset - text:GetHeight()

	GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)

	cache.LeftOffset = cache.LeftOffset + text:GetHeight() + (config.Margin * 2) + 5
end)

GM:RegisterHUDSection("hungerbar", function(colors, config, cache)
	if not GAMEMODE:GetConfig("HungerEnabled") then
		return
	end

	if LocalPlayer():GetActiveSpecies().IgnoreHungerEffects then
		return
	end

	local percentage = math.Clamp(LocalPlayer():GetHungerRatio(), 0, 1)

	cache.Hunger = math.Approach(cache.Hunger, percentage, FrameTime())

	local w = 220
	local h = 14

	local y = ScrH() - cache.LeftOffset - h

	local margin = config.Margin * 2

	surface.SetDrawColor(ColorAlpha(colors.FillDark, 200))
	surface.DrawRect(config.Offset - config.Margin, y + config.Margin, w + margin, h)

	surface.SetDrawColor(colors.ItemAllow)
	surface.DrawRect(config.Offset, y + margin, w * cache.Hunger, h - margin)

	cache.LeftOffset = cache.LeftOffset + 10 + (config.Margin * 2) + 5
end)

GM:RegisterHUDSection("healthbar", function(colors, config, cache)
	local style = GAMEMODE:GetSetting("hud_healthstyle")

	if style == HPTYPE_BAR then
		local percentage = math.Clamp(LocalPlayer():Health() / LocalPlayer():GetMaxHealth(), 0, 1)

		cache.HP = math.Approach(cache.HP, percentage, FrameTime())

		local w = 220
		local h = 14

		local y = ScrH() - cache.LeftOffset - h

		local margin = config.Margin * 2

		surface.SetDrawColor(ColorAlpha(colors.FillDark, 200))
		surface.DrawRect(config.Offset - config.Margin, y + config.Margin, w + margin, h)

		surface.SetDrawColor(colors.Primary)
		surface.DrawRect(config.Offset, y + margin, w * cache.HP, h - margin)
	elseif style == HPTYPE_HEARTBEAT then
		local w = 220
		local h = 50

		local y = ScrH() - cache.LeftOffset - h

		local margin = config.Margin * 2

		surface.SetDrawColor(ColorAlpha(colors.FillDark, 200))
		surface.DrawRect(config.Offset - config.Margin, y + config.Margin, w + margin, h)

		heartbeat.Draw(LocalPlayer(), config.Offset, y + margin, w, h - margin)
	end
end)

GM:RegisterBackgroundHUDSection("items", function(colors, config)
	if GAMEMODE:GetSetting("hud_itemstyle") == ITEMTYPE_GLOW then
		return
	end

	if GAMEMODE:GetSetting("seeall_enabled") and GAMEMODE:GetSetting("seeall_items") then
		return
	end

	for _, v in pairs(ents.FindByClass("ent_item")) do
		if v:IsDormant() then
			continue
		end

		if not v.VisFraction or v.VisFraction <= 0 then
			continue
		end

		local item = v:GetItem()

		if item then
			local text = ""

			if #string.Trim(item:GetCustomDescription()) > 0 then
				text = markleft.Parse(string.format("<font=eternity.worlditemcustom><ol><col=%s>%s", markleft.ItemColor(item), item:GetName()))
			else
				text = markleft.Parse(string.format("<font=eternity.worlditem><ol><col=%s>%s", markleft.ItemColor(item), item:GetName()))
			end

			GAMEMODE:AddWorldLabel(text, v:WorldSpaceCenter(), v.VisFraction, text:GetHeight() * 0.5)
		end
	end
end)

local modelblacklist = {
	["models/zombie/fast.mdl"] = true
}

GM:RegisterBackgroundHUDSection(nil, function(colors, config)
	if GAMEMODE:GetSetting("seeall_enabled") then
		return
	end

	local range = LocalPlayer():GetExamineRange(true)

	local configs = GAMEMODE:GetConfig("PlayerLabel")
	local players = player.GetAll()

	table.Filter(players, function(key, val)
		if val == LocalPlayer() then
			return false
		end

		if val:IsDormant() or val:GetNoDraw() then
			return false
		end

		return true
	end)

	if GAMEMODE:GetSetting("hud_legacy") then
		for _, v in pairs(players) do
			if v.HUDDistance <= (range * range) and LocalPlayer():CanSee(v) then
				v.HUDAlpha = math.Clamp(v.HUDAlpha + FrameTime(), 0, 1)
				v.HUDSeen = true
			end
		end
	else
		local tr = LocalPlayer():GetEyeTrace()
		local ent = tr.Entity

		if IsValid(ent) and ent:IsPlayer() and not ent:GetNoDraw() and ent.HUDDistance <= (range * range) then
			ent.HUDAlpha = math.Clamp(ent.HUDAlpha + FrameTime(), 0, 1)
			ent.HUDFade = CurTime() + FrameTime() + configs.Fade
		end
	end

	for _, ply in pairs(players) do
		local bone = ply:LookupBone("ValveBiped.Bip01_Head1")
		local pos

		if bone and not ply:IsInNoClip() and not modelblacklist[string.lower(ply:GetModel())] then
			pos = ply:GetBonePosition(bone) + Vector(0, 0, 9)
		else
			local _, maxs = ply:GetModelBounds()

			pos = ply:GetPos() + Vector(0, 0, maxs.z)
		end

		local offset = 0

		if GAMEMODE:GetSetting("hud_typing") and ply:Typing() != 0 and ply.HUDDistance <= (range * range) and LocalPlayer():CanSee(ply) then
			local typing = markleft.Parse(string.format("<font=eternity.labelsmall><i><ol>%s", CHATINDICATORS[ply:Typing()]))

			GAMEMODE:AddWorldLabel(typing, pos, 1, offset)

			offset = offset - typing:GetHeight()
		end

		if GAMEMODE:GetCloakVal(ply) > 0.3 then
			continue
		end

		if ply.HUDAlpha <= 0 then
			continue
		end

		if GAMEMODE:GetSetting("hud_restrained") and ply:Restrained() then
			local restrained = markleft.Parse("<font=eternity.labelsmall><ol>They're tied up")

			GAMEMODE:AddWorldLabel(restrained, pos, ply.HUDAlpha, offset)

			offset = offset - restrained:GetHeight()
		end

		local desc = string.match(ply:VisibleDescription(), "^[^\r\n]*")

		if GAMEMODE:GetSetting("hud_descriptions") and #desc > 0 then
			if #desc > configs.Desc then
				desc = string.sub(desc, 1, configs.Desc) .. "..."
			end

			desc = markleft.Parse(string.format("<font=eternity.player><ol>%s", desc))

			GAMEMODE:AddWorldLabel(desc, pos, ply.HUDAlpha, offset)

			offset = offset - desc:GetHeight()
		end

		if GAMEMODE:GetSetting("hud_playernames") then
			local name = markleft.Parse(string.format("<font=eternity.player><ol><col=%s>%s", markleft.PlayerColor(ply), ply:VisibleRPName()))

			GAMEMODE:AddWorldLabel(name, pos, ply.HUDAlpha, offset)
		end
	end
end)

GM:RegisterBackgroundHUDSection(nil, function(colors, config)
	if not GAMEMODE:GetSetting("seeall_enabled") then
		return
	end

	if GAMEMODE:GetSetting("seeall_players") then
		for _, v in pairs(player.GetAll()) do
			if v == LocalPlayer() then
				local should = LocalPlayer():ShouldDrawLocalPlayer()

				if not should or (should and ctp:IsEnabled()) then
					continue
				end
			end

			if v:HasCloak() then
				continue
			end

			local bone = v:LookupBone("ValveBiped.Bip01_Head1")
			local pos

			if bone and not v:IsInNoClip() and not modelblacklist[string.lower(v:GetModel())] then
				pos = v:GetBonePosition(bone) + Vector(0, 0, 9)
			else
				local _, maxs = v:GetModelBounds()

				pos = v:GetPos() + Vector(0, 0, maxs.z)
			end

			local offset = 0

			if GAMEMODE:GetSetting("seeall_players_hp") then
				local health = markleft.Parse(string.format("<font=eternity.player><ol><col=200,0,0>%s%%", v:Health()))

				GAMEMODE:AddWorldLabel(health, pos, 1, offset)

				offset = offset - health:GetHeight()
			end

			if GAMEMODE:GetSetting("hud_typing") and v:Typing() != 0 then
				local typing = markleft.Parse(string.format("<font=eternity.labelsmall><i><ol>%s", CHATINDICATORS[v:Typing()]))

				GAMEMODE:AddWorldLabel(typing, pos, 1, offset)

				offset = offset - typing:GetHeight()
			end

			if GAMEMODE:GetSetting("seeall_players_restrained") and v:Restrained() then
				local restrained = markleft.Parse("<font=eternity.labelsmall><ol>They're tied up")

				GAMEMODE:AddWorldLabel(restrained, pos, 1, offset)

				offset = offset - restrained:GetHeight()
			end

			if GAMEMODE:GetSetting("seeall_players_nick") then
				local nick = markleft.Parse(string.format("<font=eternity.player><ol><col=87,165,255>%s", v:Nick()))

				GAMEMODE:AddWorldLabel(nick, pos, 1, offset)

				offset = offset - nick:GetHeight()
			end

			if GAMEMODE:GetSetting("seeall_players_identity") and v:VisibleRPName() != v:RPName() then
				local color = team.GetColor(v:GetActiveSpecies().Team)
				local name = markleft.Parse(string.format("<font=eternity.player><ol><col=%s>%s", util.ColorToChat(color), v:RPName()))

				GAMEMODE:AddWorldLabel(name, pos, 1, offset)

				offset = offset - name:GetHeight()
			end

			local name = markleft.Parse(string.format("<font=eternity.player><ol><col=%s>%s", markleft.PlayerColor(v), v:VisibleRPName()))

			GAMEMODE:AddWorldLabel(name, pos, 1, offset)
		end
	end

	if GAMEMODE:GetSetting("seeall_items") then
		for _, v in pairs(ents.FindByClass("ent_item")) do
			local item = v:GetItem()

			if item then
				local text = ""

				if #string.Trim(item:GetCustomDescription()) > 0 then
					text = markleft.Parse(string.format("<font=eternity.worlditemcustom><ol><col=%s>%s", markleft.ItemColor(item), item:GetName()))
				else
					text = markleft.Parse(string.format("<font=eternity.worlditem><ol><col=%s>%s", markleft.ItemColor(item), item:GetName()))
				end

				local pos = v:WorldSpaceCenter():ToScreen()

				pos.x = math.Round(pos.x)
				pos.y = math.Round(pos.y)

				GAMEMODE:AddWorldLabel(text, v:WorldSpaceCenter(), 1, text:GetHeight() * 0.5)
			end
		end
	end

	if GAMEMODE:GetSetting("seeall_npcs") then
		local npcs = ents.GetAll()

		npcs = table.Filter(npcs, function(key, val)
			return IsValid(val) and val:IsNPC()
		end)

		for _, v in pairs(npcs) do
			if v:Health() <= 0 then
				continue
			end

			local text = markleft.Parse(string.format("<font=eternity.player><ol><col=255,255,100>#%s", v:GetClass()))

			GAMEMODE:AddWorldLabel(text, v:EyePos() + Vector(0, 0, 5), 1)
		end
	end
end)

GM.PropCache = GM.PropCache or {}

hook.Add("EntitySteamIDChanged", "hud.EntitySteamIDChanged", function(ent, old, new)
	GAMEMODE.PropCache[ent] = true
end)

GM:RegisterBackgroundHUDSection("propowner", function(colors, config)
	local range = GAMEMODE:GetConfig("EntityRange")

	local weapon = LocalPlayer():GetActiveWeapon()

	if not IsValid(weapon) or (weapon:GetClass() != "weapon_physgun" and weapon:GetClass() != "gmod_tool") then
		return
	end

	local setting = GAMEMODE:GetSetting("hud_propmode")

	for v in pairs(GAMEMODE.PropCache) do
		if not IsValid(v) then
			continue
		end

		if not v:SteamID() then
			continue
		end

		if v:WorldSpaceCenter():Distance(EyePos()) > range.Max or v:GetVisible() <= 0 then
			continue
		end

		local alpha = math.ClampedRemap(EyePos():Distance(v:WorldSpaceCenter()), range.Max, range.Min, 0, 1) * v:GetVisible()
		local pos = v:WorldSpaceCenter() + Vector(0, 0, 10)

		local offset = 0

		if setting == PROPOWNER_STEAMID or setting == PROPOWNER_BOTH then
			local steamid = markleft.Parse(string.format("<font=eternity.labelsmall><ol><col=200,200,200>%s", v:SteamID()))

			GAMEMODE:AddWorldLabel(steamid, pos, alpha, offset)

			offset = offset - steamid:GetHeight()
		end

		if setting == PROPOWNER_NAME or setting == PROPOWNER_BOTH then
			local name = markleft.Parse(string.format("<font=eternity.player><ol><col=200,200,200>%s", v:PlayerName()))

			GAMEMODE:AddWorldLabel(name, pos, alpha, offset)
		end
	end
end)

GM:RegisterBackgroundHUDSection("propdescs", function(colors, config)
	local range = GAMEMODE:GetConfig("EntityRange")

	for v in pairs(GAMEMODE.PropCache) do
		if not IsValid(v) then
			continue
		end

		if not v:Description() then
			continue
		end

		if v:WorldSpaceCenter():Distance(EyePos()) > range.Max or v:GetVisible() <= 0 then
			continue
		end

		local alpha = math.ClampedRemap(EyePos():Distance(v:WorldSpaceCenter()), range.Max, range.Min, 0, 1) * v:GetVisible()
		local pos = v:WorldSpaceCenter()

		if v:Description() then
			local description = markleft.Parse(string.format("<font=eternity.player><ol>%s", v:Description()), ScrW() / 4)

			GAMEMODE:AddWorldLabel(description, pos, alpha)
		end
	end
end)

GM:RegisterHUDSection("squad", function(colors, config, cache)
	local name = LocalPlayer():Squad()

	if name == "" then
		return
	end

	local str = "<font=eternity.labelgiant><ol>"

	str = str .. " Active Assignment: " .. name .. "\n"

	local leader = GAMEMODE:GetSquadLeader(name)

	if IsValid(leader) then
		str = str .. "<col=0,255,0>\t" .. leader:VisibleRPName() .. "</col> "
	end

	local tab = GAMEMODE:GetSquadMembers(name)

	table.sort(tab, function(a, b)
		return a:VisibleRPName() < b:VisibleRPName()
	end)

	for _, v in pairs(tab) do
		if v == leader then
			continue
		end

		local lp = v == LocalPlayer()

		local col1 = lp and "<col=255,255,0>" or ""
		local col2 = lp and "</col>" or ""

		str = str .. "\n\t" .. col1 .. v:VisibleRPName() .. col2
	end

	local text = markleft.Parse(str)

	GAMEMODE:DrawHUDBox(text, config.Offset, config.Offset, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, colors, config)
end)

GM:RegisterBackgroundHUDSection("buttons", function(colors, config)
	local eyepos = LocalPlayer():EyePos()
	local config = GAMEMODE:GetConfig("ItemRange")

	for _, v in pairs(GAMEMODE.Buttons) do
		if not IsValid(v) or v:IsDormant() or v:ButtonName() == "" then
			continue
		end

		local pos = v:WorldSpaceCenter()

		local dist = pos:Distance(eyepos)
		local aimdist = util.DistanceToLine(eyepos, eyepos + EyeAngles():Forward() * config.Dist, pos)

		local frac = math.ClampedRemap(aimdist, config.AimDist + v:BoundingRadius(), v:BoundingRadius(), 0, 1) * math.ClampedRemap(dist, 0, config.Dist, 1, 0) * v:GetVisible()

		if frac == 0 then
			continue
		end

		local text = markleft.Parse(string.format("<font=eternity.camera>%s", v:ButtonName()))

		GAMEMODE:AddWorldLabel(text, pos, frac, text:GetHeight() * 0.5)
	end
end)

hook.Add("PostRenderVGUI", "hud.PostRenderVGUI", function()
	local data = GAMEMODE.Progress

	if not data then
		return
	end

	if CurTime() > data.EndTime then
		GAMEMODE.Progress = nil

		return
	end

	local colors = GAMEMODE:GetConfig("UIColors")

	local fraction = math.ClampedRemap(CurTime(), data.StartTime, data.EndTime, 0, 1)
	local w = 400
	local h = 40
	local x = (ScrW() / 2) - (w * 0.5)
	local y = (ScrH() / 2) + h

	surface.SetDrawColor(ColorAlpha(colors.FillDark, 200))
	surface.DrawRect(x, y, w, h)

	surface.SetDrawColor(colors.Primary)
	surface.DrawRect(x + 1, y + 1, fraction * (w - 2), h - 2)

	local text = markleft.Parse(string.format("<font=eternity.labelbig><ol>%s", data.Text), w - 10)

	text:Draw(x + (w * 0.5), y + (h * 0.5), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER, 255)
end)

GM:RegisterHUDSection(nil, function(colors, config, cache)
	if not LocalPlayer():Restrained() then
		return
	end

	local text = markleft.Parse("<font=eternity.labelgiant><ol>You're tied up.")

	local x = ScrW() - config.Offset - text:GetWidth()
	local y = ScrH() - cache.RightOffset - text:GetHeight()

	GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP, colors, config)

	cache.RightOffset = cache.RightOffset + text:GetHeight() + (config.Margin * 2)
end)

GM:RegisterHUDSection("vehicle", function(colors, config, cache)
	local ply = LocalPlayer()
	local apc = ply:APC()

	if not IsValid(apc) or not ply:InVehicle() then
		return
	end

	if ply != apc:GetDriver() and ply != apc:GetGunner() then
		if apc:GetHatchLocked() then
			draw.BackgroundBlur(1)
			draw.SimpleText("You are inside the APC. The hatch is locked.", "eternity.labelmassive", ScrW() / 2, ScrH() * 0.75, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end

		return
	end

	local str = string.format("<font=eternity.labelgiant><ol>Armor:   \t%04.2f%%\nEngine:     %s\nVelocity: \t%.0f mph\nHatch:    \t%s\nSiren:     \t%s",
		apc:GetAPCHealth() / apc.MaxHealth * 100,
		not apc:GetActive() and "Off" or apc:GetSlowMode() and "Low" or "High",
		apc:GetDriverSeat():GetVelocity():Length() * (15 / 352),
		apc:GetHatchLocked() and "Locked" or "Open",
		apc:GetSirenActive() and (apc:GetNextAlarm() != -1 and "Alarm!" or "On") or "Off")

	local text = markleft.Parse(str)

	local x = ScrW() - config.Offset - text:GetWidth()
	local y = ScrH() - config.Offset - text:GetHeight()

	GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, colors, config)

	local passengers = ""
	for _, v in pairs(apc.Passengers) do
		if not IsValid(v) then
			continue
		end

		passengers = string.format("%s\n\t\t%s", passengers, v:VisibleRPName())
	end

	local occupants = string.format("<font=eternity.labelgiant><ol>Driver: %s\nGunner: %s%s",
		IsValid(apc:GetDriver()) and apc:GetDriver():VisibleRPName() or "&lt;Empty&gt;",
		IsValid(apc:GetGunner()) and apc:GetGunner():VisibleRPName() or "&lt;Empty&gt;",
		#passengers > 0 and string.format("\nPassengers:%s", passengers) or "")

	text = markleft.Parse(occupants)

	x = ScrW() - config.Offset - text:GetWidth()
	y = config.Offset

	GAMEMODE:DrawHUDBox(text, x, y, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP, colors, config)

	if ply == apc:GetGunner() then
		local driverSeat = apc:GetDriverSeat()
		local att = driverSeat:GetAttachment(driverSeat:LookupAttachment("muzzle"))

		local pos = att.Pos - 5 * att.Ang:Forward() - att.Ang:Up() * 6

		local p = util.TraceLine({
			start = pos,
			endpos = pos + att.Ang:Forward() * 16384,
			filter = {driverSeat},
			mask = MASK_SHOT
		}).HitPos:ToScreen()

		local spread = (apc.PrimarySpread * 360) * (90 / math.Clamp(GetConVar("fov_desired"):GetInt(), 75, 90))

		surface.SetDrawColor(0, 0, 0, 255 * 0.75) -- background

		surface.DrawRect(p.x - 13 - spread, p.y - 1, 12, 3) -- left
		surface.DrawRect(p.x + 3 + spread, p.y - 1, 12, 3) -- right
		surface.DrawRect(p.x - 1, p.y - 13 - spread, 3, 12) -- up
		surface.DrawRect(p.x - 1, p.y + 3 + spread, 3, 12) -- down

		surface.SetDrawColor(255, 255, 255, 255) -- Foreground

		surface.DrawRect(p.x - 12 - spread, p.y, 10, 1) -- left
		surface.DrawRect(p.x + 4 + spread, p.y, 10, 1) -- right
		surface.DrawRect(p.x, p.y - 12 - spread, 1, 10) -- up
		surface.DrawRect(p.x, p.y + 4 + spread, 1, 10) -- down
	end
end)

function GM:PreDrawHalos()
	local colors = {}

	local function add(ent, color)
		local str = tostring(color)

		if not colors[str] then
			colors[str] = {}
		end

		table.insert(colors[str], ent)
	end

	if self:GetSetting("seeall_enabled") then
		local setting = self:GetSetting("seeall_props")
		local weapon = LocalPlayer():GetActiveWeapon()

		if (setting == SEEALL_PROPS_PHYS and IsValid(weapon) and (weapon:GetClass() == "weapon_physgun" or weapon:GetClass() == "gmod_tool")) or setting == SEEALL_PROPS_ALWAYS then
			for k in pairs(self.PropCache) do
				if not IsValid(k) then
					continue
				end

				if not k:PermaProp() then
					continue
				end

				if k:GetClass() == "prop_effect" then
					add(k.AttachedEntity, Color(255, 0, 255))
				else
					add(k, Color(255, 0, 255))
				end
			end
		end
	end

	for color, tab in pairs(colors) do
		halo.Add(tab, string.ToColor(color), 1, 1, 1, true, false)
	end
end

function GM:HUDDrawTargetID()
end

function GM:HUDDrawPickupHistory()
end

function GM:DrawDeathNotice()
end

function GM:HUDShouldDraw(hud)
	if self.DisabledHUDElements[hud] then
		return false
	end

	if hud == "CHudCrosshair" and LocalPlayer():IsInCamera() then
		return false
	end

	if LocalPlayer().Restrained and LocalPlayer():Restrained() and hud == "CHudWeaponSelection" then
		return false
	end

	return true
end

function GM:WeaponSelectOpen()
	return CurTime() - self.WeaponSelectRef < self.WeaponSelectOpenTime
end


function meta:GetWeaponsInSlot(slot)
	local tab = {}

	if slot == 3 then
		for _, v in pairs(self:GetWeapons()) do
			if not v then
				continue
			end

			if GAMEMODE:WeaponSelectGetSlot(v) == slot then
				table.insert(tab, v)
			end
		end
	else
		if slot == 1 then
			if self:HasWeapon("eternity_melee_hands") then
				table.insert(tab, self:GetWeapon("eternity_melee_hands"))
			end

			if self:HasWeapon("eternity_melee_vortigaunt") then
				table.insert(tab, self:GetWeapon("eternity_melee_vortigaunt"))
			end

			if self:HasWeapon("eternity_melee_vortbroom") then
				table.insert(tab, self:GetWeapon("eternity_melee_vortbroom"))
			end

			local melee = self:GetEquipment(EQUIPMENT_MELEE)

			if melee and melee:GetBaseClass():GetClassName() == "base_weapon" and melee:GetWeaponClass() and self:HasWeapon(melee:GetWeaponClass()) then
				table.insert(tab, self:GetWeapon(melee:GetWeaponClass()))
			end

			local misc = self:GetEquipment(EQUIPMENT_MISC)

			if misc and (misc:GetBaseClass():GetClassName() == "base_weapon" or misc:GetBaseClass():GetClassName() == "base_throwable") and misc:GetWeaponClass() and self:HasWeapon(misc:GetWeaponClass()) then
				table.insert(tab, self:GetWeapon(misc:GetWeaponClass()))
			end

			for _, v in pairs(self:GetWeapons()) do
				if string.find(v:GetClass(), "eternity_xen") then
					table.insert(tab, v)
				end
			end
		else
			local primary = self:GetEquipment(EQUIPMENT_PRIMARY)

			if primary and primary:GetBaseClass():GetClassName() == "base_weapon" and primary:GetWeaponClass() and self:HasWeapon(primary:GetWeaponClass()) then
				table.insert(tab, self:GetWeapon(primary:GetWeaponClass()))
			end

			local secondary = self:GetEquipment(EQUIPMENT_SECONDARY)

			if secondary and secondary:GetBaseClass():GetClassName() == "base_weapon" and secondary:GetWeaponClass() and self:HasWeapon(secondary:GetWeaponClass()) then
				table.insert(tab, self:GetWeapon(secondary:GetWeaponClass()))
			end

			for _, v in pairs(self:GetWeapons()) do
				if v.IsTFAWeapon then
					table.insert(tab, v)
				end
			end
		end
	end

	return tab
end

function meta:FindSlotsFromWeapon()
	local wep = self:GetActiveWeapon()

	if wep != NULL then
		GAMEMODE.WeaponSelectSlot = GAMEMODE:WeaponSelectGetSlot(wep)

		local sweps = LocalPlayer():GetWeaponsInSlot(GAMEMODE.WeaponSelectSlot)

		for k,v in pairs(sweps) do
			if not v then
				continue
			end

			if v:GetClass() == wep:GetClass() then
				GAMEMODE.WeaponSelectSlotPos = k

				return
			end
		end
	end
end

function GM:WeaponSelectGetFirstPos()
	local n = 1

	while LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)[n] == NULL and n < #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot) do
		n = n + 1
	end

	return n
end

function GM:WeaponSelectNumber( n )
	if #LocalPlayer():GetWeapons() == 0 then
		return
	end

	if #LocalPlayer():GetWeaponsInSlot(n) == 0 then
		return
	end

	surface.PlaySound( "common/wpn_moveselect.wav" )

	if self:WeaponSelectOpen() then

		if self.WeaponSelectSlot == n then
			self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1

			while (LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos <= #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)) do
				self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1
			end

			while (self.WeaponSelectSlotPos > #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)) do
				self.WeaponSelectSlotPos = 1
			end

			self.WeaponSelectRef = CurTime()
		else
			self.WeaponSelectSlot = n
			self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
		end
	else
		self.WeaponSelectSlot = n;
		self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
	end

	self.WeaponSelectRef = CurTime()
end

function GM:WeaponSelectScrollDown()
	if #LocalPlayer():GetWeapons() == 0 then
		return
	end

	surface.PlaySound( "common/wpn_moveselect.wav" )

	if self:WeaponSelectOpen() then
		self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1

		while (LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos <= #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)) do
			self.WeaponSelectSlotPos = self.WeaponSelectSlotPos + 1
		end

		while (self.WeaponSelectSlotPos > #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)) do
			self.WeaponSelectSlot = self.WeaponSelectSlot + 1
			self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()

			if self.WeaponSelectSlot > 3 then
				self.WeaponSelectSlot = 1
				self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
			end
		end

		self.WeaponSelectRef = CurTime()
	else
		LocalPlayer():FindSlotsFromWeapon()
		self.WeaponSelectRef = CurTime()
	end
end

function GM:WeaponSelectScrollUp()
	if #LocalPlayer():GetWeapons() == 0 then
		return
	end

	surface.PlaySound("common/wpn_moveselect.wav")

	if self:WeaponSelectOpen() then
		self.WeaponSelectSlotPos = self.WeaponSelectSlotPos - 1

		while (LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos] == NULL and self.WeaponSelectSlotPos >= 1) do
			self.WeaponSelectSlotPos = self.WeaponSelectSlotPos - 1
		end

		while (self.WeaponSelectSlotPos < 1 or #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot) == 0) do
			self.WeaponSelectSlot = self.WeaponSelectSlot - 1
			self.WeaponSelectSlotPos = #LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)

			if self.WeaponSelectSlot < 1 then
				self.WeaponSelectSlot = 3
				self.WeaponSelectSlotPos = self:WeaponSelectGetFirstPos()
			end
		end

		self.WeaponSelectRef = CurTime()
	else
		LocalPlayer():FindSlotsFromWeapon()
		self.WeaponSelectRef = CurTime()
	end
end

function GM:WeaponSelectClick()
	surface.PlaySound("common/wpn_select.wav")

	self.WeaponSelectRef = self.WeaponSelectOpenTime * -1

	input.SelectWeapon(LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)[self.WeaponSelectSlotPos])
end

function GM:DrawWeaponSelect()
	if not self:WeaponSelectOpen() then
		local d = CurTime() - self.WeaponSelectRef

		self.WeaponSelectSlot = 1
		self.WeaponSelectSlotPos = 1

		if not (d < self.WeaponSelectOpenTime - 1 or d < self.WeaponSelectOpenTime) then
			return
		end
	end

	local colors = self:GetConfig("UIColors")

	local alpha = self:GetSetting("ui_transparent")

	local default = ColorAlpha(colors.FillLight, alpha and 200 or 255)
	local highlight = ColorAlpha(colors.PrimaryAlt, alpha and 240 or 255)

	if self.WeaponSelectSlot == 1 then
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, highlight)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2, 20, self.WeaponSelectWidth, 30, default)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 + 20 + self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, default)
	elseif self.WeaponSelectSlot == 2 then
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, default)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2, 20, self.WeaponSelectWidth, 30, highlight)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 + 20 + self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, default)
	else
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, default)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2, 20, self.WeaponSelectWidth, 30, default)
		draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 + 20 + self.WeaponSelectWidth, 20, self.WeaponSelectWidth, 30, highlight)
	end

	draw.DrawText( "Generic", "eternity.labelmassive", ScrW() / 2 - 62 - self.WeaponSelectWidth, 20, ColorAlpha(colors.TextNormal, 255))
	draw.DrawText( "Firearms", "eternity.labelmassive", ScrW() / 2 - 49, 20, ColorAlpha(colors.TextNormal, 255))
	draw.DrawText( "Utilities", "eternity.labelmassive", ScrW() / 2 - 20 + self.WeaponSelectWidth, 20, ColorAlpha(colors.TextNormal, 255))

	local y = 0;

	for k, v in pairs(LocalPlayer():GetWeaponsInSlot(self.WeaponSelectSlot)) do
		if not v then
			continue
		end

		local c = default

		if self.WeaponSelectSlotPos == k  then
			c = highlight
		end

		local text = self:WeaponSelectGetPrintName(v)

		surface.SetFont("eternity.labelbig");
		local w, h = surface.GetTextSize(text);

		if self.WeaponSelectSlotPos == k then
			local text2 = v.InfoText
			local h2 = 0

			if text2 then
				local expl = string.Explode("\n", text2)
				h2 = 18 * #expl;
			end

			draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth, 70 + y, self.WeaponSelectWidth * 3 + 40, math.max(h, h2) + 20, c)
			draw.DrawText(text, "eternity.labelbig", ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth + 10, 70 + y + 10, ColorAlpha(colors.TextNormal, 255))

			if text2 then
				local expl = string.Explode("\n", text2)

				for k, v in pairs(expl) do
					draw.DrawText(v, "eternity.labelmedium", ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth + 10 + w + 10, 70 + y + 11 + (k - 1) * 18, ColorAlpha(colors.TextNormal, 255))
				end
			end

			y = y + math.max(h, h2) + 30
		else
			draw.RoundedBox(0, ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth, 70 + y, self.WeaponSelectWidth * 3 + 40, h + 20, c )
			draw.DrawText( text, "eternity.labelbig", ScrW() / 2 - self.WeaponSelectWidth / 2 - 20 - self.WeaponSelectWidth + 10, 70 + y + 10, ColorAlpha(colors.TextNormal, 255))

			y = y + h + 30
		end
	end
end
