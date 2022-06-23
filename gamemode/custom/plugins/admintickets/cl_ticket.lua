local PANEL = {}

local TICKET_ACTIONS = {
	["Claim"] = function(ticket, button)
		if !IsValid(ticket.assigned) then
			net.Start("ClaimTicket")
				net.WriteUInt(ticket.index, 32)
			net.SendToServer()

			button:SetText("Close")
		elseif ticket.assigned == LocalPlayer() then
			net.Start("CloseTicket")
				net.WriteUInt(ticket.index, 32)
			net.SendToServer()
		end
	end,
	["Bring"] = function(ticket)
		RunConsoleCommand("rpa_bring", ticket.initiator:Name())
	end,
	["Goto"] = function(ticket)
		RunConsoleCommand("rpa_goto", ticket.initiator:Name())
	end,
	["Return"] = function(ticket)
		RunConsoleCommand("rpa_return", ticket.initiator:Name())
	end,
	["Copy SteamID"] = function(ticket)
		SetClipboardText(ticket.initiator:SteamID())
	end,
}

function PANEL:Init()
	self:SetZPos(-32766)
	self:SetSize(ScrW() * 0.2, ScrH() * 0.2)

	-- cant use dock because of spawn menu, sad!
	local y = 10

	for id, ticket in pairs(GAMEMODE.Tickets) do
		if IsValid(ticket.panel) then
			y = y + ticket.panel:GetTall() + 10
		end
	end

	self:SetPos(10, y)

	self:SetAllowEscape(false)
	self:SetDrawTopBar(true)
	self:SetTitle("Request")

	self.actions = self:Add("eternity_basepanel")
	self.actions:Dock(RIGHT)
	self.actions:SetWide(self:GetWide() * 0.33)

	for ActionName, ActionFunc in pairs(TICKET_ACTIONS) do
		local button = self.actions:Add("eternity_button")

		button:Dock(TOP)
		button:SetText(ActionName)
		button.DoClick = function()
			local ticket = GAMEMODE.Tickets[self.TicketIndex]

			ActionFunc(ticket, button)
		end
	end

	self.text = self:Add("eternity_label")
	self.text:SetText("")
	self.text:Dock(FILL)
	self.text:SetWrap(true)
	self.text:SetContentAlignment(7)
end

function PANEL:GetTicket()
	return GAMEMODE.Tickets[self.TicketIndex]
end

function PANEL:SetTicket(index)
	self.TicketIndex = index

	local ticket = self:GetTicket()

	self:SetTitle(Format("(%s) Request #%d", ticket.initiator:Name(), index))
	self:UpdateText(ticket.text)
end

function PANEL:UpdateText(text)
	self.text:SetText(text)
end

function PANEL:SetAssigned(ply)
	local ticket = self:GetTicket()

	self.AssignedPlayer = ply
	self:SetTitle(Format("(%s) Request #%d (Claimed by %s)", ticket.initiator:Name(), self.TicketIndex, ply:Name()))
end

function PANEL:RemoveTicket()
	self:MoveBy(-(self:GetWide() + 20), 0, 1, 0, -1, function()
		self:Remove()

		GAMEMODE:UpdateTicketOrder()
	end)
end

vgui.Register("eternity_ticket", PANEL, "eternity_basepanel")

PANEL = {}

local function GetSteamNames(stack)
	local top = stack:Top()

	steamworks.RequestPlayerInfo(util.SteamIDTo64(top.id), function(steamName)
		top.line:SetColumnText(2, steamName)
		stack:Pop()

		if stack:Size() > 0 then
			GetSteamNames(stack)
		end
	end)
end

function PANEL:Init()
	self:SetAllowEscape(true)
	self:SetDrawTopBar(true)

	self:SetTitle("Request Statistics")
	self:SetSize(ScrW() * 0.5, ScrH() * 0.5)

	self:Center()
	self:MakePopup()

	self.list = self:Add("eternity_listview")
	self.list:Dock(FILL)
	self.list:AddColumn("SteamID")
	self.list:AddColumn("Steam Name")
	self.list:AddColumn("Week Count")
	self.list:AddColumn("Total Count")
	function self.list:OnRowRightClick(lineID, line)
		local menu = EternityDermaMenu()
		menu:AddOption("Copy SteamID", function()
			SetClipboardText(line:GetColumnText(1))
		end)
		menu:Open()
	end
end

function PANEL:PopulateData(data)
	local stack = util.Stack()
	for i,info in ipairs(data) do
		local line = self.list:AddLine(info.steamID, "Loading...", info.totalCount, info.weekCount)
		stack:Push({line = line, id = info.steamID})
	end

	if stack:Size() > 0 then
		GetSteamNames(stack)
	end
end

vgui.Register("eternity_viewtickets", PANEL, "eternity_basepanel")
