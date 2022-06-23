console.AddCommand("rpa_togglecombinewaiver", function(ply, waiver)
    if not ply:HasCharacter() then
        Feedback(ply, "You need to be an active character to do this.", "ERROR")

        return
    end

    local access = ply:IsAdmin() or ply:HasCombinePermission(COMBINE_ADMINS_WAIVER)

    if not access then
        Feedback(ply, "You need to be an admin or Combine leader to do this.", "ERROR")

        return
    end

    waiver = waiver - 1

    if waiver < COMBINEWAIVER_NONE or waiver > COMBINEWAIVER_AUTONOMOUS then
        Feedback(ply, "Waiver number must be 1 (disabled), 2 (judgement), or 3 (autonomous).", "ERROR")

        return
    end

    GAMEMODE:SetCombineWaiverState(waiver)

    GAMEMODE:WriteLog("combine_waiver", {
        Ply = GAMEMODE:LogPlayer(ply),
        Char = GAMEMODE:LogCharacter(ply),
        State = waiver
    })
end, COMMAND_ALL, {CTYPE_NUMBER}, {},
"Combine", "Allows you update the server's CombineWaiverState accessor.")

console.AddCommand("rpa_setcombinesquad", function(ply, target, squad)
	local set = string.upper(string.sub(squad, 1, 31))

	target:SetCombineSquad(set)

	target:SendChat("NOTICE", string.format("%s has set your Combine squad to %s", PlayerName(ply), set))
	ply:SendChat("NOTICE", string.format("You have set %s's Combine squad to %s", PlayerName(target), set))
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_STRING}, {CFLAG_FORCESINGLETARGET}, "Combine", "Sets the visible Combine squad of a character.")

console.AddCommand("rpa_setcombinerank", function(ply, target, rank)
	if tonumber(rank) == nil then
		ply:SendChat("ERROR", "You must enter a valid number for setting someone's digit-rank.")

		return
	end

	target:SetCombineRank(tonumber(rank))

	target:SendChat("NOTICE", string.format("%s has set your Combine rank to %02i", PlayerName(ply), tonumber(rank)))
	ply:SendChat("NOTICE", string.format("You have set %s's Combine rank to %02i", PlayerName(target), tonumber(rank)))
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_NUMBER}, {CFLAG_FORCESINGLETARGET}, "Combine", "Sets the visible Combine rank of a character.")
