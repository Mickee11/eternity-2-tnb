local HungerRatio = 0

hook.Add("Initialize", "hunger.Initialize", function()
    local enabled = GAMEMODE:GetConfig("HungerEnabled")

    if not enabled then
        HungerRatio = nil

        return
    end

    HungerRatio = GAMEMODE:GetConfig("HungerMax") / GAMEMODE:GetConfig("HungerTick")

    timer.Create("hunger.Initialize.Timer", 60, 0, function()
        for k,v in pairs(player.GetAll()) do
            if not v then
                continue
            end
        
            if not v:HasCharacter() then
                continue
            end

            if not v:Alive() then
                continue
            end
        
            local species = v:GetActiveSpecies()
        
            if not species then
                continue
            end
        
            if species.IgnoreHungerEffects then
                continue
            end
        
            v:SetHungerBar(math.Clamp(v:HungerBar() + HungerRatio, 0, GAMEMODE:GetConfig("HungerMax")))

            local ratio = v:GetHungerRatio()

            if ratio <= 0.5 then
                v:SetHealth(math.Clamp(v:Health() + 2, 0, v:GetMaxHealth()))
            elseif ratio <= 0.75 then
                v:SetHealth(math.Clamp(v:Health() + 1, 0, v:GetMaxHealth()))
            end
        end
    end)
end)

hook.Add("PlayerHungerBarChanged", "hunger.PlayerHungerBarChanged", function(ply, old, new)
	ply:HandleMoveSpeed()
end)
