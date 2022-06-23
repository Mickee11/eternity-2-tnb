local meta = FindMetaTable("Player")

function meta:TopDonatorPackage()
    if self:HasDonatorPackage(DONATORPACKAGE_GOLD) then
        return DONATORPACKAGE_GOLD
    end

    if self:HasDonatorPackage(DONATORPACKAGE_SILVER) then
        return DONATORPACKAGE_SILVER
    end

    if self:HasDonatorPackage(DONATORPACKAGE_BRONZE) then
        return DONATORPACKAGE_BRONZE
    end

    return nil
end

function meta:HasDonatorPackage(id)
    return tobool(bit.band(self:DonatorPackages(), 2^(id - 1)))
end

function meta:IsDonatorHidden()
    if self:IsDeveloper() then
        return self:AdminHidden()
    end

    if self:TopDonatorPackage() ~= nil then
        return self:DonatorHidden()
    end

    return true
end

if SERVER then
    function meta:GiveDonatorPackage(id)
        if self:HasDonatorPackage(id) then
            return
        end

        self:SetDonatorPackages(self:DonatorPackages() + 2^(id - 1))
    end

    function meta:TakeDonatorPackage(id)
        if not self:HasDonatorPackage(id) then
            return
        end

        self:SetDonatorPackages(self:DonatorPackages() - 2^(id - 1))
    end

    hook.Add("PlayerThink", "donator.PlayerThink", function(ply)
        local vec = Vector(38 / 255, 207 / 255, 233 / 255)

        if ply:IsDeveloper() then
            local dev = ply:GetSetting("dev_physgun_mode")

            if dev != PHYSGUNMODE_DEFAULT then
                if dev == PHYSGUNMODE_RAINBOW_CLASSIC then
                    for i = 1, 3 do
                        vec[i] = math.abs(math.sin(CurTime() * 2.4 + (2 * i)))
                    end
                elseif dev == PHYSGUNMODE_RAINBOW_NEW then
                    local time = CurTime() * 50
                    local col = HSVToColor(time % 360, 1, 1)
        
                    vec = Vector(col.r / 255, col.g / 255, col.b / 255)
                end
            elseif not ply:IsDonatorHidden() then
                local col = ply:GetSetting("donator_physgun_custom_color")

                vec = Vector(col.r / 255, col.g / 255, col.b / 255)
            end
        else
            local package = ply:TopDonatorPackage()

            if package and package >= DONATORPACKAGE_SILVER and not ply:IsDonatorHidden() then
                local col = ply:GetSetting("donator_physgun_custom_color")

                vec = Vector(col.r / 255, col.g / 255, col.b / 255)
            end
        end

        ply:SetWeaponColor(vec)
    end)

    hook.Add("OnSettingChanged", "donator.OnSettingChanged", function(ply, key, old, new)
        if key == "donator_status_show" then
            ply:SetDonatorHidden(not new)

            return
        end

        if key == "donator_scoreboard_text" then
            ply:SetDonatorTitleText(new)
            
            return
        end

        if key == "donator_scoreboard_color" then
            ply:SetDonatorTitleColor({new.r, new.g, new.b})
            
            return
        end
    end)
end