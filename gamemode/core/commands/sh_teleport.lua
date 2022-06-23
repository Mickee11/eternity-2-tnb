console.AddCommand("rpa_goto", function(ply, target)
	ply.LastPos = ply:GetPos()
	ply:SetPos(target:GetPos())
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET, CFLAG_NOSELFTARGET, CFLAG_NOCONSOLE},
"Teleport", "Sends yourself to another player")

console.AddCommand("rpa_bring", function(ply, targets)
	for _, v in pairs(targets) do
		v.LastPos = v:GetPos()
		v:SetPos(ply:GetPos())
	end
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_NOSELFTARGET, CFLAG_NOCONSOLE},
"Teleport", "Sends another player to you")

console.AddCommand("rpa_send", function(ply, from, to)
	from.LastPos = from:GetPos()
	from:SetPos(to:GetPos())
end, COMMAND_ADMIN, {CTYPE_PLAYER, CTYPE_PLAYER}, {CFLAG_FORCESINGLETARGET, CFLAG_NOSELFTARGET},
"Teleport", "Sends one player to another")

console.AddCommand({"rpa_tp", "rpa_teleport"}, function(ply, targets)
	local pos = ply:GetEyeTrace().HitPos

	for _, v in pairs(targets) do
		v:SetPos(pos)
	end
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_NOCONSOLE},
"Teleport", "Send a player to wherever you're looking")

console.AddCommand("rpa_return", function(ply, targets)
	for _, v in pairs(targets) do
		v:SetPos(v.LastPos or v:GetPos())
	end
end, COMMAND_ADMIN, {CTYPE_PLAYER}, {CFLAG_NOCONSOLE},
"Teleport", "Returns a player back to their original position")
