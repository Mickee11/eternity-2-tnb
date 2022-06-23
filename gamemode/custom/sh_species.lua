function GM:EternityPostLoadSpecies()
    for k, v in pairs(includes.Folder("species")) do
        local var = _G[string.upper(k)]

        if var then
            v.ID = var
            v.Enum = string.sub(k, 9)

            class.Register(k, v)

            GAMEMODE.Species[var] = class.Instance(k)
        end
    end
end