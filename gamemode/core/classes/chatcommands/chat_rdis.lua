local CLASS = class.Create("base_chatcommand")

CLASS.Name = "Radio Dispatch"
CLASS.Description = "Send a message through radio dispatch."

CLASS.Category = "Radio"

CLASS.Commands = {"rdis", "rdispatch"}

CLASS.UseLanguage = false

CLASS.PlainType = "Say"

CLASS.Logged = "RADIO DISPATCH"
CLASS.Tabs = TAB_RADIO

if SERVER then
    function CLASS:Handle(ply, lang, cmd, text)
        if not ply:IsAdmin() and not ply:HasCombinePermission(COMBINE_MESSAGE_RADIO) then
            ply:SendChat("ERROR", "You are not authorized to access radio dispatch.")

            return
        end

        local group, message = string.match(text, "(%w+)(.+)")

		message = string.sub(message, 1, GAMEMODE:GetConfig("ChatLimit"))
        message = string.Trim(message)
        message = string.Escape(message)

        group = _G["RADIOGROUP_" .. string.upper(group)]

        if group == nil then
            group = RADIOGROUP_CCA -- Defaults to CCA.
            message = text -- Restore original message.
        end

        GAMEMODE:SendDispatchMessage(message, {group}, ply)

		local tab = {
			__Type = self.Name,
			Name = ply:VisibleRPName(),
			Text = message,
		}

        self:DoLog(ply, tab)
	end
end

return CLASS