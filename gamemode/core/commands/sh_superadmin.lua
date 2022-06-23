console.AddCommand("rpa_setusergroup", function(ply, steamid, usergroup)
	local target = player.GetBySteamID(steamid)
	local group = USERGROUPS[usergroup]

	if IsValid(target) then
		target:SetAdminLevel(usergroup)
		target:SendChat("NOTICE", string.format("%s has set your usergroup to %s", PlayerName(ply), group.Title))

		Feedback(ply, string.format("You've set %s's usergroup to %s", target:Nick(), group.Title))

		GAMEMODE:WriteLog("admin_usergroup", {
			Admin = GAMEMODE:LogPlayer(ply),
			Ply = GAMEMODE:LogPlayer(target),
			Usergroup = usergroup
		})

		return
	end

	dbal.Update("eternity", "$players", {["AdminLevel"] = usergroup}, "SteamID = ?", steamid, stub)

	GAMEMODE:WriteLog("admin_usergroup_offline", {
		Admin = GAMEMODE:LogPlayer(ply),
		SteamID = steamid,
		Usergroup = usergroup
	})
end, COMMAND_DEV, {CTYPE_STEAMID, CTYPE_USERGROUP}, {CFLAG_CHECKIMMUNITY, CFLAG_FORCESINGLETARGET, CFLAG_NOSELFTARGET},
"Superadmin", "Sets a player's usergroup.")

console.AddCommand("rpa_setprivatemode", function(ply, usergroup)
	local name = string.lower(USERGROUPS[usergroup].Title)

	if IsValid(ply) and usergroup > ply:AdminLevel() then
		Feedback(ply, "Setting this private mode would lock you out as well!", "ERROR")

		return
	end

	GAMEMODE.Config.PrivateMode = usergroup

	GAMEMODE:WriteLog("admin_privatemode", {
		Admin = GAMEMODE:LogPlayer(ply),
		Usergroup = usergroup
	})

	for _, v in pairs(player.GetAll()) do
		if v:AdminLevel() >= usergroup then
			continue
		end

		game.KickID(v:UserID(), "This server is currently locked to whitelisted users, sorry!")
	end

	Feedback(ply, string.format("You've set the server's private mode to %ss or higher", name))
end, COMMAND_DEV, {CTYPE_USERGROUP}, {},
"Superadmin", "Sets the private mode for the server, kicking players in the process.")

console.AddCommand("rpa_nodamage", function(ply, targets, bool)
	local format = bool and "%s gave you godmode" or "%s took your godmode"

	for _, v in pairs(targets) do
		v:SetNoDamage(bool)
		v:SendChat("NOTICE", string.format(format, PlayerName(ply)))
	end

	if bool then
		Feedback(ply, string.format("You've given godmode to %s", TargetName(targets, "RPName")))
	else
		Feedback(ply, string.format("You've taken godmode from %s", TargetName(targets, "RPName")))
	end

	GAMEMODE:WriteLog("admin_nodamage", {
		Admin = GAMEMODE:LogPlayer(ply),
		Char = GAMEMODE:LogCharacter(target),
		Ply = GAMEMODE:LogPlayer(target),
		Bool = bool
	})
end, COMMAND_SA, {CTYPE_PLAYER, CTYPE_BOOL}, {CFLAG_CHECKIMMUNITY},
"Superadmin", "Disables damage on a player.")

console.AddCommand("rpa_hide", function(ply, targets)
	for _, v in pairs(targets) do
		local hide = not v:Hidden()
		v:SetHidden(hide)
		v:SendChat("NOTICE", string.format("%s has toggled your scoreboard visibility", PlayerName(ply)))

		GAMEMODE:WriteLog("admin_hide", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v),
			Hide = hide
		})
	end

	Feedback(ply, string.format("You've toggled scoreboard visibility for %s", TargetName(targets, "RPName")))
end, COMMAND_SA, {CTYPE_PLAYER}, {},
"Superadmin", "Toggles hiding a character from the scoreboard.")

console.AddCommand("rpa_givemoney", function(ply, targets, amount)
	for _, v in pairs(targets) do
		v:GiveMoney(amount)
		v:SendChat("NOTICE", string.format("%s has given you %s credits", PlayerName(ply), amount))

		GAMEMODE:WriteLog("admin_givemoney", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v),
			Amount = amount
		})
	end

	Feedback(ply, string.format("You've given %s credits to %s", amount, TargetName(targets, "RPName")))
end, COMMAND_SA, {CTYPE_PLAYER, CTYPE_STRING}, {},
"Superadmin", "Gives a player money.")

console.AddCommand("rpa_takemoney", function(ply, targets, amount)
	for _, v in pairs(targets) do
		v:TakeMoney(amount)
		v:SendChat("NOTICE", string.format("%s has taken %s credits from you", PlayerName(ply), amount))

		GAMEMODE:WriteLog("admin_takemoney", {
			Admin = GAMEMODE:LogPlayer(ply),
			Char = GAMEMODE:LogCharacter(v),
			Ply = GAMEMODE:LogPlayer(v),
			Amount = amount
		})
	end

	Feedback(ply, string.format("You've taken %s credits from %s", amount, TargetName(targets, "RPName")))
end, COMMAND_SA, {CTYPE_PLAYER, CTYPE_NUMBER}, {},
"Superadmin", "Takes money from a player.")
