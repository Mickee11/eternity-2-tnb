local CLASS = class.Create("chat_radio")

CLASS.Name = "Radio yell"
CLASS.Description = "Yell into your radio if you have one."

CLASS.Commands = {"ry"}

local config = GAMEMODE:GetConfig("ChatRanges")

CLASS.Range = config.Yell
CLASS.MuffledRange = config.Speak

CLASS.PlainType = "Yell"
CLASS.Tabs = TAB_RADIO

if CLIENT then
	function CLASS:OnReceive(data, colors)
		local lang = data.Lang != 1
		local color = lang and colors.Language or colors.Radio
		local freq = data.Frequency

		color = util.ColorToChat(self:ApplyChatFocus(data.Ply, color))

		if freq >= 1000 then
			freq = RADIOSETS[freq].Title
		else
			freq = string.format("%s MHz", freq)
		end

		local text

		if lang then
			local name = LANGUAGES[data.Lang].Name

			if LocalPlayer():CanHearLanguage(data.Lang) then
				text = string.format("[%s] [%s] %s: %s", freq, name, data.Name, data.Text)
			else
				text = string.format("[%s] %s yells something in %s!", freq, data.Name, form, name)
			end
		else
			text = string.format("[%s] %s: %s", freq, data.Name, data.Text)
		end

		GAMEMODE:GetGUI("ChatRadio"):AddMessage("<b>" .. text)

		return string.format("<col=%s><b>%s", color, text)
	end
end

return CLASS