local PANEL = {}

function PANEL:Init()
	self:SetSize(650, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Dispatch Access")

	local bottom1 = self:Add("eternity_panel")

	bottom1:DockMargin(0, 5, 0, 0)
	bottom1:Dock(BOTTOM)
    bottom1:SetTall(22)
    
	self.ToggleNoWaiver = bottom1:Add("eternity_button")
	self.ToggleNoWaiver:Dock(LEFT)
    self.ToggleNoWaiver:SetWide(140)
    self.ToggleNoWaiver:SetText("Disable Community Waivers")

	self.ToggleJudgementWaiver = bottom1:Add("eternity_button")
	self.ToggleJudgementWaiver:Dock(LEFT)
    self.ToggleJudgementWaiver:SetWide(140)
    self.ToggleJudgementWaiver:DockMargin(10, 0, 0, 0)
    self.ToggleJudgementWaiver:SetText("Enable Judgement Waiver")

    self.ToggleAutonomousWaiver = bottom1:Add("eternity_button")
	self.ToggleAutonomousWaiver:Dock(LEFT)
    self.ToggleAutonomousWaiver:SetWide(140)
    self.ToggleAutonomousWaiver:DockMargin(10, 0, 0, 0)
    self.ToggleAutonomousWaiver:SetText("Enable Autonomous Waiver")

    if GAMEMODE:IsCombineJudgementWaiver() then
        self.ToggleJudgementWaiver:SetDisabled(true)
    end

    if GAMEMODE:IsCombineAutonomousWaiver() then
        self.ToggleAutonomousWaiver:SetDisabled(true)
    end

    if not GAMEMODE:IsCombineJudgementWaiver() and not GAMEMODE:IsCombineAutonomousWaiver() then
        self.ToggleNoWaiver:SetDisabled(true)
    end

    self.ToggleNoWaiver.DoClick = function()
        RunConsoleCommand("rpa_togglecombinewaiver", 1)

        self.ToggleNoWaiver:SetDisabled(true)
        self.ToggleJudgementWaiver:SetDisabled(false)
        self.ToggleAutonomousWaiver:SetDisabled(false)
    end

    self.ToggleJudgementWaiver.DoClick = function()
        RunConsoleCommand("rpa_togglecombinewaiver", 2)

        self.ToggleNoWaiver:SetDisabled(false)
        self.ToggleJudgementWaiver:SetDisabled(true)
        self.ToggleAutonomousWaiver:SetDisabled(false)
    end

    self.ToggleAutonomousWaiver.DoClick = function()
        RunConsoleCommand("rpa_togglecombinewaiver", 3)

        self.ToggleNoWaiver:SetDisabled(false)
        self.ToggleJudgementWaiver:SetDisabled(false)
        self.ToggleAutonomousWaiver:SetDisabled(true)
    end

	self.PlayLine = bottom1:Add("eternity_button")
	self.PlayLine:Dock(RIGHT)
	self.PlayLine:SetWide(100)
	self.PlayLine:SetText("Play Dispatch Line")

	self.PlayLine.DoClick = function()
		netstream.Send("PlayDispatchVoiceLineRequest", {
			Index = self.DispatchLineIndex
		})

		self:Remove()
	end

	self.PlayLine:SetDisabled(true)

	self.List = self:Add("eternity_listview")
	self.List:Dock(FILL)

	self.List:SetMultiSelect(false)

	self.List:AddColumn("Dispatch Voice Line")

	self.List.OnRowSelected = function(pnl, index, row)
		self.DispatchLineIndex = row.Index

		self.PlayLine:SetDisabled(false)
	end

	self.List.DoDoubleClick = function(pnl, index, row)
		self.DispatchLineIndex = row.Index

		self.PlayLine:SetDisabled(false)
		self.PlayLine:DoClick()
	end

	self:MakePopup()
	self:Center()

	self:Populate()
end

function PANEL:Populate()
	self.PlayLine:SetDisabled(true)
	self.List:Clear()

	local lines = {}

	if LocalPlayer():HasCombinePermission(COMBINE_ADMINS_WAIVER) then
        for k,v in pairs(GAMEMODE.DispatchVoicelines) do
            lines[v[2]] = k
        end
    end
    
	for k, v in SortedPairs(lines) do
		self.List:AddLine(k).Index = v
    end
end

vgui.Register("eternity_dispatchaccess", PANEL, "eternity_basepanel")

GM:RegisterGUI("DispatchAccess", function()
	return vgui.Create("eternity_dispatchaccess")
end, true)