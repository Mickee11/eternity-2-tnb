_G.COMBINEWAIVER_NONE = _G.COMBINEWAIVER_NONE or 0
_G.COMBINEWAIVER_JUDGEMENT = _G.COMBINEWAIVER_JUDGEMENT or 1
_G.COMBINEWAIVER_AUTONOMOUS = _G.COMBINEWAIVER_AUTONOMOUS or 2

accessor.Global("CombineWaiverState", COMBINEWAIVER_NONE, ACCESSOR_SHARED)

function GM:IsCombineJudgementWaiver()
    return self:CombineWaiverState() == COMBINEWAIVER_JUDGEMENT
end

function GM:IsCombineAutonomousWaiver()
    return self:CombineWaiverState() == COMBINEWAIVER_AUTONOMOUS
end

if CLIENT then
    local LastWaiverSoundTime = nil
    local LastWaiverVoiceTime = nil

    local function HandleCombineWaiver()
        if GAMEMODE:CombineWaiverState() == COMBINEWAIVER_NONE then
            LastWaiverSoundTime = nil
            LastWaiverVoiceTime = nil

            return
        end

        if not LastWaiverSoundTime then
            LastWaiverSoundTime = CurTime() + 6
        end

        if not LastWaiverVoiceTime then
            LastWaiverVoiceTime = CurTime()
        end

        local time = CurTime()

        if time >= LastWaiverVoiceTime then
            LastWaiverVoiceTime = time + 180

            if GAMEMODE:IsCombineAutonomousWaiver() then
                surface.PlaySound("npc/overwatch/cityvoice/f_protectionresponse_4_spkr.wav")
            else
                surface.PlaySound("npc/overwatch/cityvoice/f_protectionresponse_5_spkr.wav")
            end
        end

        if time >= LastWaiverSoundTime then
            LastWaiverSoundTime = time + 30

            surface.PlaySound("ambient/alarms/citadel_alert_loop2.wav")
        end
    end

    hook.Add("GlobalCombineWaiverStateChanged", "CL.CombineWaiverState", function(old, new)
        if new == COMBINEWAIVER_NONE and timer.Exists("CL.CombineWaiverState.Timer") then
            timer.Remove("CL.CombineWaiverState.Timer")

            LastWaiverSoundTime = nil
            LastWaiverVoiceTime = nil
        end

        if new ~= COMBINEWAIVER_NONE and not timer.Exists("CL.CombineWaiverState.Timer") then
            timer.Create("CL.CombineWaiverState.Timer", 1, 0, HandleCombineWaiver)
        end
    end)
end