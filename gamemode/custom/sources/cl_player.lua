netstream.Hook("player.EmitLostBiosignalSound", function(data)
	if not GAMEMODE:GetSetting("sounds_biosignal") then
		return
	end

	local ply = data.Player

	local cid = ply:VisibleCitizenNumber()
	local len = math.floor(SoundDuration("npc/overwatch/radiovoice/lostbiosignalforunit.wav"))
	local cur = 1

	surface.PlaySound("npc/overwatch/radiovoice/lostbiosignalforunit.wav")

	timer.Simple(len, function()
		timer.Create(string.format("human.DeathTimer.%s", ply:SteamID64()), 0.5, 5, function()
			surface.PlaySound(string.format("npc/overwatch/radiovoice/%s.wav", util.DigitToString(cid[cur])))
			cur = cur + 1

			if cur < 6 then
				return
			end

			timer.Simple(0.5, function()
				surface.PlaySound("npc/overwatch/radiovoice/remainingunitscontain.wav")
			end)
		end)
	end)
end)