-- kill all PascalCase users
GM.Tickets = GM.Tickets or {}

/*
	Hooks
*/

function GM:PlayerTicketCreated(ply, text)
	if ply.ActiveTicket then return end

	local ticket = {
		initiator = ply,
		text = text,
	}

	local index = table.insert(self.Tickets, ticket)
	ply.ActiveTicket = index

	net.Start("TicketCreated")
		net.WriteUInt(index, 32)
		net.WriteEntity(ply)
		net.WriteString(text)
	net.Send(player.GetUsergroup(USERGROUP_ADMIN))
end

function GM:PlayerTicketAppend(ply, text)
	local index = ply.ActiveTicket
	local ticket = self.Tickets[index]
	if !ticket then return end

	ticket.text = ticket.text .. "\n" .. text

	net.Start("TicketUpdated")
		net.WriteUInt(index, 32)
		net.WriteString(ticket.text)
	net.Send(player.GetUsergroup(USERGROUP_ADMIN))
end

function GM:PlayerTicketClaimed(index, claimant)
	local ticket = self.Tickets[index]
	if !ticket then return end

	ticket.assigned = claimant

	net.Start("TicketClaimed")
		net.WriteUInt(index, 32)
		net.WriteEntity(claimant)
	net.Send(player.GetUsergroup(USERGROUP_ADMIN))

	GAMEMODE:SendChat("NOTICE", Format("Your ticket has been claimed by %s.", claimant:GetName()), ticket.initiator)
end

function GM:PlayerTicketDestroyed(index)
	local ticket = self.Tickets[index]
	if !ticket then return end

	ticket.initiator.ActiveTicket = nil

	net.Start("TicketDestroyed")
		net.WriteUInt(index, 32)
	net.Send(player.GetUsergroup(USERGROUP_ADMIN))

	self.Tickets[index] = nil
end

function GM:PlayerDisconnected(ply)
	if ply.ActiveTicket then
		hook.Run("PlayerTicketDestroyed", ply.ActiveTicket)
	end
end

/*
	Networking
*/

util.AddNetworkString("TicketCreated")
util.AddNetworkString("TicketUpdated")
util.AddNetworkString("TicketClaimed")
util.AddNetworkString("TicketDestroyed")

util.AddNetworkString("CloseTicket")
util.AddNetworkString("ClaimTicket")
util.AddNetworkString("RequestTickets")
util.AddNetworkString("ViewTickets")

net.Receive("ClaimTicket", function(len, ply)
	if !ply:IsAdmin() then return end

	local index = net.ReadUInt(32)
	local ticket = GAMEMODE.Tickets[index]

	if !ticket then return end
	if IsValid(ticket.assigned) then return end

	hook.Run("PlayerTicketClaimed", index, ply)
end)

local INSERT_QUERY = "INSERT INTO `tickets` (`Creator`, `ClosedBy`) VALUES ('%s', '%s');"

net.Receive("CloseTicket", function(len, ply)
	if !ply:IsAdmin() then return end

	local TicketIndex = net.ReadUInt(32)
	local ticket = GAMEMODE.Tickets[TicketIndex]

	if !ticket then return end
	if ticket.assigned != ply then return end

	GAMEMODE:SendChat("NOTICE", Format("Your ticket has been closed by %s. Report this incident if your issue was not resolved.", ply:GetName()), ticket.initiator)

	dbal.RawQuery("eternity", Format(INSERT_QUERY, ticket.initiator:SteamID(), ticket.assigned:SteamID()))

	hook.Run("PlayerTicketDestroyed", TicketIndex)
end)

net.Receive("RequestTickets", function(len, ply)
	if !ply:IsAdmin() then return end

	for index,ticket in next, GAMEMODE.Tickets do
		net.Start("TicketCreated")
			net.WriteUInt(index, 32)
			net.WriteEntity(ticket.initiator)
			net.WriteString(ticket.text)
		net.Send(ply)
	end
end)

/*
	Database
*/

local TABLE_QUERY = [[
	CREATE TABLE IF NOT EXISTS `tickets` (
		id INT(12) AUTO_INCREMENT,
		Creator VARCHAR(256) NOT NULL,
		ClosedTime DATETIME DEFAULT CURRENT_TIMESTAMP(),
		ClosedBy VARCHAR(256) NOT NULL,
		PRIMARY KEY (id)
	)
]]

hook.Add("OnDBALConnected", "CreateTicketsTable", function(key)
	if key != "eternity" then
		return
	end

	dbal.RawQuery("eternity", TABLE_QUERY)
end)

/*
	Commands
*/

local GET_TICKET_STATS = [[
	SELECT `ClosedBy`, COUNT(*) AS `TotalCount`, COUNT(CASE WHEN DATEDIFF(NOW(), `ClosedTime`) <= 7 THEN 1 END) AS `WeekCount` FROM `tickets` GROUP BY `ClosedBy`;
]]

console.AddCommand("rpa_viewtickets", function(ply)
	dbal.RawQuery("eternity", GET_TICKET_STATS, function(data)
		net.Start("ViewTickets")
			net.WriteUInt(#data, 32)
			for _,info in ipairs(data) do
				net.WriteString(info.ClosedBy)
				net.WriteUInt(info.TotalCount, 32)
				net.WriteUInt(info.WeekCount, 32)
			end
		net.Send(ply)
	end)
end, COMMAND_DEV, {})
