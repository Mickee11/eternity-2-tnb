local CLASS = class.Create("base_chatcommand")

CLASS.Name = "City Admin Broadcast"
CLASS.Description = "Send a message through city administration broadcasts."

CLASS.Category = "Emotes"

CLASS.Commands = {"bc", "broadcast"}

CLASS.UseLanguage = false

CLASS.Logged = "EMOTE"
CLASS.Tabs = TAB_IC

if CLIENT then
    function CLASS:OnReceive(data, colors)
        print(string.format("(%s) [BROADCAST] %s", data.Name, data.Text))

		return string.format("<col=%s>[BROADCAST] %s</col>", util.ColorToChat(colors.Broadcast), data.Text)
	end
end

if SERVER then
    function CLASS:Parse(ply, cmd, text, lang)
        if not ply:IsAdmin() and not ply:HasCombinePermission(COMBINE_MESSAGE_BROADCAST) then
            ply:SendChat("ERROR", "You are not authorized to access broadcasts.")

            return
        end

		return {
			UserID = ply:UserID(),
			Name = ply:VisibleRPName(),
			Text = text
		}
	end
end

return CLASS