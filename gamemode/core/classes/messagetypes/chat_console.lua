local CLASS = class.Create("base_chatcommand")

CLASS.Name = "CONSOLE"

CLASS.Tabs = nil

if CLIENT then
	function CLASS:OnReceive(data, colors)
		return string.format("<col=%s>%s", util.ColorToChat(colors.Console), data.Text)
	end
end

return CLASS