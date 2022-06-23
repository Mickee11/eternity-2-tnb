local CLASS = class.Create("base_chatcommand")

CLASS.Name = "Advert"
CLASS.Description = "Character shop advertisements."

CLASS.Category = "Emotes"

CLASS.Commands = {"ad", "advert"}
CLASS.Indicator = CHATINDICATOR_TYPING

CLASS.Logged = "EMOTE"
CLASS.Tabs = TAB_IC

if CLIENT then
    function CLASS:OnReceive(data, colors)
        print(string.format("(%s) [ADVERT] %s", data.Name, data.Text))

		return string.format("<col=%s>[ADVERT] %s</col>", util.ColorToChat(colors.Advert), data.Text)
	end
end

if SERVER then
    function CLASS:Parse(ply, cmd, text, lang)
        if not ply:HasMoney(5) then
            ply:SendChat("ERROR", "You need 5 credits to send a business advertisement.")

            return true
        end

        ply:TakeMoney(5)

		return {
			UserID = ply:UserID(),
			Name = ply:VisibleRPName(),
			Text = text
		}
	end
end

return CLASS