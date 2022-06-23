local PANEL = {}

local function sort(a, b)
	return a:VisibleRPName() < b:VisibleRPName()
end

function PANEL:Init()
	self:SetSize(620, ScreenScale(200))

	self:DockPadding(0, 50, 0, 0)

	self:MakePopup()
	self:Center()

	self:SetKeyboardInputEnabled(false)

	self.Players = self:Add("eternity_scrollpanel")
	self.Players:Dock(FILL)

	local teams = table.Copy(TEAMS)
	table.sort(teams, function(a, b) return a.ScoreOrder < b.ScoreOrder end)

	for k, v in pairs(teams) do
		if team.NumPlayers(v.Id) == 0 then
			continue
		elseif v.Hidden and not LocalPlayer():IsAdmin() and not LocalPlayer():Team() == v.Id then
			continue
		end

		local players = team.GetPlayers(v.Id)

		table.Filter(players, function(key, val)
			if val:CanSeeOnScoreboard() then
				return true
			end

			return false
		end)

		if #players < 1 then
			continue
		end

		table.sort(players, sort)

		local label = self.Players:Add("eternity_label")

		label:SetFont("eternity.labelgiant")
		label:SetText(v.Name)
		label:SetContentAlignment(4)
		label:DockMargin(10, 10, 0, 10)
		label:Dock(TOP)
		label:SizeToContents()

		self.Players:AddItem(label)

		if LocalPlayer():IsAdmin() then
			local count = label:Add("eternity_label")
			local text = string.format("%s/%s", #players, player.GetCount())

			count:SetFont("eternity.labelgiant")
			count:SetText(text)
			count:SetContentAlignment(6)
			count:DockMargin(0, 0, 10, 0)
			count:Dock(RIGHT)
			count:SizeToContents()
		end

		local alt = true

		for _, ply in pairs(players) do
			local entry = self.Players:Add("eternity_scoreboardentry")

			entry:Dock(TOP)
			entry:SetTall(57)
			entry:SetPlayer(ply)
			entry:SetAlt(alt)

			self.Players:AddItem(entry)

			alt = not alt
		end
	end

	self.Players:InvalidateParent(true)
	self.Players:AutoSize()
	self.Players:UpdateLayout()
end

function PANEL:Paint(w, h)
	local colors = GAMEMODE:GetConfig("UIColors")
	local alpha = GAMEMODE:GetSetting("ui_transparent")

	surface.SetDrawColor(ColorAlpha(colors.FillDark, alpha and 230 or 255))
	surface.DrawRect(0, 0, w, h)

	surface.SetDrawColor(colors.Border)
	surface.DrawRect(0, 0, w, 50)

	draw.DrawText(GAMEMODE:GetConfig("ServerName"), "eternity.labelmassive", 185, 10, colors.TextNormal)

	return true
end

vgui.Register("eternity_scoreboard", PANEL, "eternity_basepanel")

GM:RegisterGUI("Scoreboard", function()
	return vgui.Create("eternity_scoreboard")
end, true)

function GM:ScoreboardShow()
	self:OpenGUI("Scoreboard")
end

function GM:ScoreboardHide()
	local pnl = self:GetGUI("Scoreboard")

	if IsValid(pnl) then
		pnl:Remove()
	end
end
