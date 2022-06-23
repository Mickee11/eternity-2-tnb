GM:RegisterLogType("combine_requisition", LOG_COMBINE, function(data)
    return string.format("%s has requisitioned %s", GAMEMODE:FormatCharacter(data.Char), GAMEMODE:FormatItem(data.Item))
end)

GM:RegisterLogType("combine_ration", LOG_COMBINE, function(data)
    return string.format("%s has collected their ration", GAMEMODE:FormatCharacter(data.Char))
end)

GM:RegisterLogType("combine_waiver", LOG_COMBINE, function(data)
    local state = "disabled"

    if data.State == COMBINEWAIVER_JUDGEMENT then
        state = "judgement"
    elseif data.State == COMBINEWAIVER_AUTONOMOUS then
        state = "autonomous"
    end

    return string.format("%s (%s) has changed the CombineWaiverState: %s", GAMEMODE:FormatPlayer(data.Ply), GAMEMODE:FormatCharacter(data.Char), state)
end)
