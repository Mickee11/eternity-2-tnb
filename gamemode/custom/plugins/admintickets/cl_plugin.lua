GM.Tickets = GM.Tickets or {}

/*
	Networking
*/

net.Receive("TicketCreated", function()
	local index = net.ReadUInt(32)
	local initiator = net.ReadEntity()
	local text = net.ReadString()

	GAMEMODE.Tickets[index] = {
		initiator = initiator,
		text = text,
		index = index,
	}

	hook.Run("PlayerTicketCreated", index, initiator, text)
end)

net.Receive("TicketUpdated", function()
	local index = net.ReadUInt(32)
	local text = net.ReadString()

	local ticket = GAMEMODE.Tickets[index]
	if !ticket then return end

	ticket.text = text

	hook.Run("PlayerTicketUpdated", index, text)
end)

net.Receive("TicketClaimed", function()
	local index = net.ReadUInt(32)
	local admin = net.ReadEntity()

	local ticket = GAMEMODE.Tickets[index]
	if !ticket then return end

	ticket.assigned = admin

	hook.Run("PlayerTicketClaimed", index, admin)
end)

net.Receive("TicketDestroyed", function()
	local index = net.ReadUInt(32)

	hook.Run("PlayerTicketDestroyed", index)

	GAMEMODE.Tickets[index] = nil
end)

net.Receive("ViewTickets", function()
	local data = {}
	local count = net.ReadUInt(32)

	for i = 1, count do
		data[i] = {
			steamID = net.ReadString(),
			totalCount = net.ReadUInt(32),
			weekCount = net.ReadUInt(32)
		}
	end

	local pnl = vgui.Create("eternity_viewtickets")
	pnl:PopulateData(data)
end)

/*
	Hooks
*/

function GM:PlayerTicketCreated(index, ply, text)
	local ticket = self.Tickets[index]
	if !ticket then return end -- ??

	ticket.panel = vgui.Create("eternity_ticket")
	ticket.panel:SetTicket(index)
end

function GM:PlayerTicketUpdated(index, text)
	local ticket = self.Tickets[index]
	if !ticket then return end -- ??

	if IsValid(ticket.panel) then
		ticket.panel:UpdateText(text)
	end
end

function GM:PlayerTicketClaimed(index, ply)
	local ticket = self.Tickets[index]
	if !ticket then return end -- ??

	local pnl = ticket.panel

	if IsValid(pnl) then
		pnl:SetAssigned(ply)

		if ply != LocalPlayer() then
			hook.Run("PlayerTicketDestroyed", index)

			GAMEMODE.Tickets[index] = nil
		end
	end
end

function GM:PlayerTicketDestroyed(index)
	local ticket = self.Tickets[index]
	if !ticket then return end -- ??

	if IsValid(ticket.panel) then
		ticket.panel:RemoveTicket()
	end
end

function GM:UpdateTicketOrder()
	timer.Simple(0, function()
		local y = 10

		for id, tab in pairs(GAMEMODE.Tickets) do
			if IsValid(tab.panel) then
				tab.panel:SetPos(10, y)

				y = y + tab.panel:GetTall() + 10
			end
		end
	end)
end

hook.Add("InitPostEntity", "RequestTickets", function()
	net.Start("RequestTickets")
	net.SendToServer()
end)
