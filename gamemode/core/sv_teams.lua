hook.Add("PlayerInitialSpawn", "teams.PlayerInitialSpawn", function(ply)
    for k,v in pairs(TEAMS) do
        if k == 0 then
            continue
        end

        GAMEMODE:SendTeamHiddenState(k, v.Hidden, ply)
    end
end)

function GM:SendTeamHiddenState(tid, state, ply)
    netstream.Send("TeamHiddenState", {
        Team = tid,
        State = state
    }, ply)
end