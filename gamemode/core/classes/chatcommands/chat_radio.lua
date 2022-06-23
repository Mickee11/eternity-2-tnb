local CLASS = class.Create("base_chatcommand")

CLASS.Name = "Radio"
CLASS.Description = "Speak into your radio if you have one."

CLASS.Category = "Radio"

CLASS.Commands = {"r"}
CLASS.Indicator = CHATINDICATOR_RADIOING

CLASS.UseLanguage = true

local config = GAMEMODE:GetConfig("ChatRanges")

CLASS.Range = config.Speak
CLASS.MuffledRange = config.Whisper

CLASS.PlainType = "Say"

CLASS.Logged = "RADIO"
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
				local char = string.Right(data.Text, 1)
				local form = "says"

				if char == "?" then
					form = "asks"
				elseif char == "!" then
					form = "exclaims"
				end

				text = string.format("[%s] %s %s something in %s.", freq, data.Name, form, name)
			end
		else
			text = string.format("[%s] %s: %s", freq, data.Name, data.Text)
		end

		GAMEMODE:GetGUI("ChatRadio"):AddMessage(text)

		return string.format("<col=%s>%s", color, text)
	end
end

if SERVER then
	function CLASS:Handle(ply, lang, cmd, text)
		text = string.sub(text, 1, GAMEMODE:GetConfig("ChatLimit"))
		text = string.Escape(text)

		if self.UseLanguage then
			if #ply:GetLanguages() == 0 then
				ply:SendChat("ERROR", "You have no mouth but you must scream.")

				return
			elseif not ply:HasLanguage(lang) then
				ply:SendChat("ERROR", "You don't speak this language!")

				return
			end
		end

		local range = ply:GetExamineRange()
		local ent = ply:GetEyeTrace().Entity
		
		if IsValid(ent) and ent:WithinInteractRange(ply, range) and ent:GetClass() == "ent_stationaryradio" and ent:IsReady() and ent:GetTalkable() == 1 then
			local data = ent:GetFrequency()

			local targets, plaintargets, badtargets = GAMEMODE:GetRadioTargets(ply, data, nil, self.Range, self.MuffledRange, self.Hearable)

			if #targets > 0 then
				local tab = {
					__Type = self.Name,
					Name = ply:VisibleRPName(),
					Text = text,
					Lang = lang,
					Frequency = data
				}

				netstream.Send("SendChat", tab, targets)
			end

			if #plaintargets > 0 then
				local tab = {
					__Type = self.PlainType,
					Ply = ply,
					Name = ply:VisibleRPName(),
					Text = text,
					Lang = lang
				}

				netstream.Send("SendChat", tab, plaintargets)
			end

			if #badtargets > 0 then
				local tab = {
					__Type = self.Name,
					Name = "Unknown",
					Text = string.Gibberish(text, 50),
					Lang = LANG_ENG,
					Frequency = data
				}

				netstream.Send("SendChat", tab, badtargets)
			end

			local tab = {
				__Type = self.Name,
				Name = ply:VisibleRPName(),
				Text = text,
				Lang = lang,
				Frequency = data
			}

			self:DoLog(ply, tab)	
		else
			local head = ply:GetEquipment(EQUIPMENT_HEAD)

			local radio = ply:GetEquipment(EQUIPMENT_RADIO)

			if head and head:GetClassName() == "clothing_head_radioset" then
				if not radio then
					ply:SendChat("ERROR", "Your headset can't work without a reciever.")

					return
				end
			elseif radio and radio:GetClassName() == "radio_headsetpart" then
				if not head then
					ply:SendChat("ERROR", "Your reciever can't transmit without a headset.")

					return
				elseif head and head:GetClassName() ~= "clothing_head_radioset" then
					ply:SendChat("ERROR", "Your reciever can't transmit without a headset.")

					return
				end
			elseif not radio then
				ply:SendChat("ERROR", "You don't have a radio!")

				return
			end

			local ok, reason = radio:CanTransmit(ply)

			if not ok then
				ply:SendChat("ERROR", reason or "Your radio isn't configured properly!")

				return
			end

			local data = radio:GetChannelData()

			local targets, plaintargets, badtargets = GAMEMODE:GetRadioTargets(ply, data.Frequency, data.Key, self.Range, self.MuffledRange, self.Hearable)

			if #targets > 0 then
				local tab = {
					__Type = self.Name,
					Name = ply:VisibleRPName(),
					Text = text,
					Lang = lang,
					Frequency = data.Frequency
				}

				netstream.Send("SendChat", tab, targets)
			end

			if #plaintargets > 0 then
				local tab = {
					__Type = self.PlainType,
					Ply = ply,
					Name = ply:VisibleRPName(),
					Text = text,
					Lang = lang
				}

				netstream.Send("SendChat", tab, plaintargets)
			end

			if #badtargets > 0 then
				local tab = {
					__Type = self.Name,
					Name = "Unknown",
					Text = string.Gibberish(text, 50),
					Lang = LANG_ENG,
					Frequency = data.Frequency
				}

				netstream.Send("SendChat", tab, badtargets)
			end

			local tab = {
				__Type = self.Name,
				Name = ply:VisibleRPName(),
				Text = text,
				Lang = lang,
				Frequency = data.Frequency
			}

			self:DoLog(ply, tab)
		end
	end
end

return CLASS