function GM:Move(ply, move)
    if not ply:HasCharacter() then
        return self.BaseClass:Move(ply, move)
    end

    local species = ply:GetActiveSpecies()

    if species and species.CustomMove then
        species:Move(ply, move)
    end

    return self.BaseClass:Move(ply, move)
end
