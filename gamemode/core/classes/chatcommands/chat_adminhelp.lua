local CLASS = class.Create("base_chatcommand")

CLASS.Name = "Adminhelp"
CLASS.Description = "Creates an admin ticket."

CLASS.Category = "OOC"

CLASS.Commands = {"ahelp"}

if SERVER then
	function CLASS:Parse(ply, cmd, text, lang)
		if !ply.ActiveTicket then
			hook.Run("PlayerTicketCreated", ply, text)
		elseif GAMEMODE.Tickets[ply.ActiveTicket] then
			hook.Run("PlayerTicketAppend", ply, text)
		end

		local command = GAMEMODE.MessageTypes.Admin

		command:Handle(ply, lang, "admin", text)

		return true
	end
end

return CLASS
