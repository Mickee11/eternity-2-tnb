netstream.Hook("TeamHiddenState", function(data)
    TEAMS[data.Team].Hidden = data.State
end)