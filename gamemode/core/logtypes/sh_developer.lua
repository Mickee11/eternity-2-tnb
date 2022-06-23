GM:RegisterLogType("prometheus_processed", LOG_DEVELOPER, function(data)
	return string.format("Processed a new donation from %s for the %s package", GAMEMODE:FormatPlayer(data.Ply), string.lower(DONATORPACKAGES[data.Package].Name))
end)

GM:RegisterLogType("prometheus_revoked", LOG_DEVELOPER, function(data)
	return string.format("Revoked an old donation from %s for the %s package", GAMEMODE:FormatPlayer(data.Ply), string.lower(DONATORPACKAGES[data.Package].Name))
end)

GM:RegisterLogType("donator_given", LOG_DEVELOPER, function(data)
	return string.format("%s granted %s access to the %s package", GAMEMODE:FormatPlayer(data.Ply), GAMEMODE:FormatPlayer(data.Target), string.lower(DONATORPACKAGES[data.Package].Name))
end)

GM:RegisterLogType("donator_taken", LOG_DEVELOPER, function(data)
	return string.format("%s took %s's access to the %s package", GAMEMODE:FormatPlayer(data.Ply), GAMEMODE:FormatPlayer(data.Target), string.lower(DONATORPACKAGES[data.Package].Name))
end)

GM:RegisterLogType("runlua_server", LOG_DEVELOPER, function(data)
	return string.format("%s ran the following against the gameserver: %s", GAMEMODE:FormatPlayer(data.Ply), data.Str)
end)

GM:RegisterLogType("runlua_client", LOG_DEVELOPER, function(data)
	return string.format("%s ran the following against %s's client: %s", GAMEMODE:FormatPlayer(data.Ply), GAMEMODE:FormatPlayer(data.Target), data.Str)
end)

GM:RegisterLogType("announcement_chat", LOG_DEVELOPER, function(data)
	return string.format("%s sent the following message to all clients: %s", GAMEMODE:FormatPlayer(data.Ply), data.Str)
end)