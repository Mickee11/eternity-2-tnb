local CLASS = class.Create("base_chatcommand")

CLASS.Name = "OOC"
CLASS.Description = "Global out-of-character."

CLASS.Category = "OOC"

CLASS.Commands = {"ooc"}
CLASS.Indicator = CHATINDICATOR_TYPING

CLASS.Logged = "OOC"
CLASS.Tabs = TAB_OOC

if CLIENT then
	function CLASS:OnReceive(data, colors)
		return string.format("<col=%s>[OOC]</col> <col=%s>%s</col>: %s", util.ColorToChat(colors.OOC), markleft.PlayerColor(Player(data.UserID)), data.Name, data.Text)
	end
end

if SERVER then
	function CLASS:Parse(ply, cmd, text, lang)
		if ply:OOCMuted() then
			ply:SendChat("ERROR", "You are muted from OOC.")

			return true
		end

		local delay = GAMEMODE:OOCDelay()

		if not ply:IsAdmin() then
			if delay > 0 then
				local time = (ply.LastOOC or 0) + delay

				if time > CurTime() then
					ply:SendChat("ERROR", string.format("You need to wait %s to talk in OOC.", string.NiceTime(time - CurTime())))

					return true
				end
			elseif delay == -1 then
				ply:SendChat("ERROR", "OOC chat is currently disabled by the administrators.")

				return true
			end
		end

		ply.LastOOC = CurTime()

		return {
			UserID = ply:UserID(),
			Name = ply:VisibleRPName(),
			Text = text
		}
	end
end

return CLASS
