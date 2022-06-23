console.AddCommand("rp_onduty", function(ply)
	if not ply:HasCharacter() then
		return
	end

	local species = ply:GetActiveSpecies()

	if not species then
		return
	end

	local state = species.SpeciesStates[ply:SpeciesState()]

	if not state then
		Feedback(ply, "Your character does not have the ability to flag on-duty.", "ERROR")

		return
	end

	if not state.Flagged then
		Feedback(ply, "Your character does not have the ability to flag on-duty.", "ERROR")

		return
	end

	if not IsValid(ply:GetZone(state.Flagged.FlaggingZone)) then
		Feedback(ply, "You may only toggle your duty state inside your faction's main facility.")

		return
	end

	if ply:IsFlagged() then
		Feedback(ply, "Your character is already on-duty.", "ERROR")

		return
	end

	ply:SetIsFlagged(true)
	Feedback(ply, "You clock in for your shift, going on-duty.", "NOTICE")

	if SERVER then
		ply:HandleFlagChange(true)
	end
end, COMMAND_ALL, {}, {},
"Character", "Allows certain characters to flag on-duty for special factions.")

console.AddCommand("rp_offduty", function(ply)
	if not ply:HasCharacter() then
		return
	end

	local species = ply:GetActiveSpecies()

	if not species then
		return
	end

	local state = species.SpeciesStates[ply:SpeciesState()]

	if not state then
		Feedback(ply, "Your character does not have the ability to flag off-duty.", "ERROR")

		return
	end

	if not state.Flagged then
		Feedback(ply, "Your character does not have the ability to flag off-duty.", "ERROR")

		return
	end

	if not IsValid(ply:GetZone(state.Flagged.FlaggingZone)) then
		Feedback(ply, "You may only toggle your duty state inside your faction's main facility.")

		return
	end

	if not ply:IsFlagged() then
		Feedback(ply, "Your character is already off-duty.", "ERROR")

		return
	end

	ply:SetIsFlagged(false)
	Feedback(ply, "You clock out from your shift, going off-duty.", "NOTICE")

	if SERVER then
		ply:HandleFlagChange(false)
	end
end, COMMAND_ALL, {}, {},
"Character", "Allows certain characters to flag off-duty for special factions.")

console.AddClientCommand("rp_uptime", function()
	print("Server uptime: " .. string.NiceTime(CurTime()))
end, COMMAND_ALL, {}, {},
"Clientside", "Prints out how long the server has been running.")

console.AddCommand("rp_togglehud", function(ply)
	ply:SetSetting("hud_enabled", not ply:GetSetting("hud_enabled"))
end, COMMAND_ALL, {}, {},
"Clientside", "Toggles your HUD on or off.")

console.AddCommand("rp_togglelegacy", function(ply)
	ply:SetSetting("hud_legacy", not ply:GetSetting("hud_legacy"))
end, COMMAND_ALL, {}, {},
"Clientside", "Toggles between legacy and modern HUD modes.")

console.AddCommand("rp_toggleholster", function(ply)
	ply:ToggleHolster()
end, COMMAND_ALL, {}, {},
"Clientside", "Toggles the current weapon's holster status, if supported.")

console.AddCommand("rp_thirdperson", function(ply)
	ply:SetSetting("hud_thirdperson", not ply:GetSetting("hud_thirdperson"))
end, COMMAND_ALL, {}, {},
"Clientside", "Toggles your thirdperson status.")

console.AddClientCommand("rp_stopmusic", function(ply)
	if GAMEMODE.PlayURL then
		GAMEMODE.PlayURL:Stop()
		GAMEMODE.PlayURL = nil
	end

	if GAMEMODE.Music then
		GAMEMODE.Music:Stop()
		GAMEMODE.Music = nil
	end
end, COMMAND_ALL, {}, {},
"Clientside", "Stops any currently playing music tracks or URLs")

console.AddCommand("rp_roll", function(ply, args)
	local num, sides, sign, mod

	num, sides, sign, mod = string.match(args, "^ *(%d+)d(%d+) *([%+%-]?) *(%d*) *$")

	num = tonumber(num)
	sides = tonumber(sides)
	mod = tonumber(mod)

	if not (num and sides) then
		ply:SendChat("ERROR", "Missing arguments.")

		return
	end

	num = math.Clamp(num, 1, 10)
	sides = math.Clamp(sides, 2, 20)

	local results = {}
	local total = 0

	for i = 1, num do
		local roll = math.random(sides)

		total = total + roll

		table.insert(results, roll)
	end

	local output
	local str = table.concat(results, " + ")

	if #sign > 0 and mod != 0 then
		local mult = tonumber(sign .. mod)

		total = total + mult
		output = string.format("%s rolled %id%i%s%i: (%s) %s %i = %i", ply:VisibleRPName(), num, sides, sign, mod, str, sign, mod, total)
	else
		output = string.format("%s rolled %id%i: (%s) = %i", ply:VisibleRPName(), num, sides, str, total)
	end

	local range = GAMEMODE:GetConfig("ChatRanges").Speak
	local targets = GAMEMODE:GetChatTargets(ply:EyePos(), range, 0)

	GAMEMODE:SendChat("NOTICE", output, targets)
end, COMMAND_ALL, {CTYPE_STRING}, {CFLAG_NOCONSOLE},
"Clientside", "Rolls a dice, format is NdX+m, where N = # of dice, X = # of sides per die, m = optional modifier")