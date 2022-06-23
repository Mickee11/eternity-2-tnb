local modes = {
	{Default = true, Func = playerreg.GetData},
	{Name = "ip", Func = playerreg.GetByIP},
	{Name = "gameid", Func = playerreg.GetByGameID}
}

console.AddCommand("dev_reg", function(ply, steamid, mode)
	if not playerreg.Exists(steamid) then
		Feedback(ply, "This SteamID isn't registered!", "ERROR")

		return
	end

	if mode == "all" then
		for _, v in pairs(modes) do
			v.Func(ply, steamid)
		end

		return
	end

	local found = false

	for _, v in pairs(modes) do
		if (mode == "" and v.Default) or v.Name == mode then
			found = true

			v.Func(ply, steamid)

			break
		end
	end

	if not found then
		Feedback(ply, "Invalid mode.", "ERROR")
	end
end, COMMAND_DEV, {CTYPE_STEAMID, CTYPE_STRING})

console.AddCommand("dev_runlua", function(ply, str)
	GAMEMODE:RunDebug(ply, str)
end, COMMAND_DEV, {CTYPE_STRING})

console.AddCommand("dev_runcl", function(ply, targ, str)
	netstream.Send("RunLua", {
		Ply = ply,
		Str = str
	}, targ)
end, COMMAND_DEV, {CTYPE_PLAYER, CTYPE_STRING}, {CFLAG_FORCESINGLETARGET})

console.AddCommand("dev_givedonatorpackage", function(ply, targ, package)
	targ:GiveDonatorPackage(package)

	GAMEMODE:WriteLog("donator_given", {
		Ply = GAMEMODE:LogPlayer(ply),
		Target = GAMEMODE:LogPlayer(targ),
		Package = package
	})
end, COMMAND_DEV, {CTYPE_PLAYER, CTYPE_DONATORPACKAGE}, {CFLAG_FORCESINGLETARGET})

console.AddCommand("dev_takedonatorpackage", function(ply, targ, package)
	targ:TakeDonatorPackage(package)

	GAMEMODE:WriteLog("donator_taken", {
		Ply = GAMEMODE:LogPlayer(ply),
		Target = GAMEMODE:LogPlayer(targ),
		Package = package
	})
end, COMMAND_DEV, {CTYPE_PLAYER, CTYPE_DONATORPACKAGE}, {CFLAG_FORCESINGLETARGET})

console.AddCommand("dev_say", function(ply, str)
	for k,v in pairs(player.GetAll()) do
		v:SendChat("CONSOLE", str)
	end

	GAMEMODE:WriteLog("announcement_chat", {
		Ply = GAMEMODE:LogPlayer(ply),
		Str = str
	})
end, COMMAND_DEV, {CTYPE_STRING})