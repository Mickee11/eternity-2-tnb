netstream.Hook("UnitActivityRemoveID", function(ply, data)
    local char = data.CharID

    local data = dbal.Query("eternity", "SELECT SpeciesState, id FROM $chars WHERE id = ?", char)[1]

    if not data then
        return
    end 

    local remove = false

    if data.SpeciesState == "police_squadleader" and ply:SpeciesState() == "police_captain" then
        remove = true
    elseif data.SpeciesState == "police_adjutant" and ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) then
        remove = true
    elseif (data.SpeciesState == "police_recruit" or data.SpeciesState == "police_unit") and (ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) or ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE)) then
        remove = true
    end

    if remove then
        dbal.Update("eternity", "$chars", {SpeciesState = "citizen"}, "id = ?", char)

        for k,v in pairs(player.GetAll()) do
            if not v:HasCharacter() then
                continue
            end

            if v:CharID() == char then
                v:SetSpeciesState("citizen")
            end
        end
    end
end)

netstream.Hook("UnitActivityFetchAll", function(ply)
    if not ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) and not ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE) then
        return
    end

    local data = dbal.Query("eternity", "SELECT LastFlagged, CitizenNumber, CombineRank, CombineSquad, SpeciesState, id FROM $chars WHERE SpeciesState LIKE 'police_%'")
    local valid = {}

    for k,v in pairs(data) do
        if type(k) == "string" and k == "LastInsert" then
            continue
        end

        if v.SpeciesState == "police_captain" and ply:SpeciesState() == "police_captain" then
            table.insert(valid, v)
        elseif (v.SpeciesState == "police_squadleader" or v.SpeciesState == "police_adjutant") and (ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) or ply:SpeciesState() == "police_captain") then
            table.insert(valid, v)
        elseif (v.SpeciesState == "police_recruit" or v.SpeciesState == "police_unit") and ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE) then
            table.insert(valid, v)
        end
    end

    netstream.Send("UnitActivityFetchAllClient", {
        Data = valid,
    }, ply)
end)

netstream.Hook("UnitManagementDemoteClass", function(ply, data)
    local unit = data.Unit
    local char = data.Char

    if not unit or not unit:HasCharacter() or not unit:CharID() == char then
        ply:SendChat("ERROR", "That unit is no longer visible on the roster and cannot be updated.")
        
        return
    end

    if ply == unit then
        return
    end

    local state = ply:GetActiveSpecies().SpeciesStates[ply:SpeciesState()]

    if state == nil or state.Flagged == nil then
        return
    end

    local target = unit:GetActiveSpecies().SpeciesStates[unit:SpeciesState()]

    if target == nil or target.Flagged == nil then
        return
    end

    if state.Flagged.CombineLevel and target.Flagged.CombineLevel and state.Flagged.CombineLevel >= target.Flagged.CombineLevel then
        if unit:SpeciesState() == "police_squadleader" and ply:SpeciesState() == "police_captain" then
            unit:SetSpeciesState("police_adjutant")
        elseif unit:SpeciesState() == "police_adjutant" and ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) then
            unit:SetSpeciesState("police_unit")
        elseif unit:SpeciesState() == "police_unit" then
            unit:SetSpeciesState("police_recruit")
        end
    end
end)

netstream.Hook("UnitManagementPromoteClass", function(ply, data)
    local unit = data.Unit
    local char = data.Char

    if not unit or not unit:HasCharacter() or not unit:CharID() == char then
        ply:SendChat("ERROR", "That unit is no longer visible on the roster and cannot be updated.")
        
        return
    end

    if ply == unit then
        return
    end

    local state = ply:GetActiveSpecies().SpeciesStates[ply:SpeciesState()]

    if state == nil or state.Flagged == nil then
        return
    end

    local target = unit:GetActiveSpecies().SpeciesStates[unit:SpeciesState()]

    if target == nil or target.Flagged == nil then
        return
    end

    if state.Flagged.CombineLevel and target.Flagged.CombineLevel and state.Flagged.CombineLevel >= target.Flagged.CombineLevel then
        if unit:SpeciesState() == "police_adjutant" and ply:SpeciesState() == "police_captain" then
            unit:SetSpeciesState("police_squadleader")
        elseif unit:SpeciesState() == "police_unit" and ply:HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) then
            unit:SetSpeciesState("police_adjutant")
        elseif unit:SpeciesState() == "police_recruit" then
            unit:SetSpeciesState("police_unit")
        end
    end
end)

netstream.Hook("UnitManagementSetGrade", function(ply, data)
    local unit = data.Unit
    local grade = data.Requested
    local char = data.Char

    if not unit or not unit:HasCharacter() or not unit:CharID() == char then
        ply:SendChat("ERROR", "That unit is no longer visible on the roster and cannot be updated.")
        
        return
    end

    if ply == unit then
        return
    end

    local state = ply:GetActiveSpecies().SpeciesStates[ply:SpeciesState()]

    if state == nil or state.Flagged == nil then
        return
    end

    local target = unit:GetActiveSpecies().SpeciesStates[unit:SpeciesState()]

    if target == nil or target.Flagged == nil then
        return
    end

    if state.Flagged.CombineLevel and target.Flagged.CombineLevel and state.Flagged.CombineLevel > target.Flagged.CombineLevel then
        unit:SetCombineRank(grade)
    end
end)

netstream.Hook("UnitManagementSetSquad", function(ply, data)
    local unit = data.Unit
    local squad = data.Requested
    local char = data.Char

    if not unit or not unit:HasCharacter() or not unit:CharID() == char then
        ply:SendChat("ERROR", "That unit is no longer visible on the roster and cannot be updated.")
        
        return
    end

    if ply == unit then
        return
    end

    local state = ply:GetActiveSpecies().SpeciesStates[ply:SpeciesState()]

    if state == nil or state.Flagged == nil then
        return
    end

    local target = unit:GetActiveSpecies().SpeciesStates[unit:SpeciesState()]

    if target == nil or target.Flagged == nil then
        return
    end

    if state.Flagged.CombineLevel and target.Flagged.CombineLevel and state.Flagged.CombineLevel > target.Flagged.CombineLevel then
        unit:SetCombineSquad(squad)
    end
end)