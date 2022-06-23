local CLASS = class.Create("base_chatcommand")

CLASS.Name = "City Dispatch"
CLASS.Description = "Send a message through city dispatch."

CLASS.Category = "Radio"

CLASS.Commands = {"dis", "dispatch"}

CLASS.UseLanguage = false

CLASS.Logged = "Say"
CLASS.Tabs = TAB_IC

if CLIENT then
    function CLASS:OnReceive(data, colors)
        print(string.format("(%s) [DISPATCH] %s", data.Name, data.Text))

		return string.format("<col=%s>[DISPATCH] %s</col>", util.ColorToChat(colors.Dispatch), data.Text)
	end
end

if SERVER then
    function CLASS:Parse(ply, cmd, text, lang)
        if not ply:IsAdmin() and not ply:HasCombinePermission(COMBINE_MESSAGE_DISPATCH) then
            ply:SendChat("ERROR", "You are not authorized to access city dispatch.")

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