-- npc/overwatch/radiovoice/lostbiosignalforunit.wav
-- npc/overwatch/radiovoice/one.wav -- npc/overwatch/radiovoice/nine.wav
-- npc/overwatch/radiovoice/remainingunitscontain.wav

GM.DispatchVoicelines = {
	[1] = { "npc/overwatch/cityvoice/f_anticitizenreport_spkr.wav", "Attention, ground units. Anticitizen reported in this community. Code: lock, cauterize, stabilize." },
	[2] = { "npc/overwatch/cityvoice/f_anticivil1_5_spkr.wav", "You are charged with anticivil activity level one. Protection units: prosecution code duty, sword, operate." },
	[3] = { "npc/overwatch/cityvoice/f_anticivilevidence_3_spkr.wav", "Protection team alert: Evidence of anticivil activity in this community. Code: assemble, clamp, contain." },
	[4] = { "npc/overwatch/cityvoice/f_capitalmalcompliance_spkr.wav", "Individual: you are charged with capital malcompliance. Anticitizen status approved." },
	[5] = { "npc/overwatch/cityvoice/f_ceaseevasionlevelfive_spkr.wav", "Individual: you are now charged with socioendangerment level five. Cease evasion immediately; receive your verdict." },
	[6] = { "npc/overwatch/cityvoice/f_citizenshiprevoked_6_spkr.wav", "Individual: you are convicted of multi anticivil violations. Implicit citizenship revoked. Status: malignant." },
	[7] = { "npc/overwatch/cityvoice/f_confirmcivilstatus_1_spkr.wav", "Attention please: unidentified person of interest, confirm your civil status with local protection team immediately." },
	[8] = { "npc/overwatch/cityvoice/f_evasionbehavior_2_spkr.wav", "Attention please: evasion behavior consistant with malcompliant defendant. Ground protection team: alert. Code: isolate, expose, administer." },
	[9] = { "npc/overwatch/cityvoice/f_innactionisconspiracy_spkr.wav", "Citizen reminder: inaction is conspiracy. Report counterbehavior to a civil protection team immediately." },
	[10] = { "npc/overwatch/cityvoice/f_localunrest_spkr.wav", "Alert, community ground protection units: local unrest structure detected. Assemble, administer, pacify." },
	[11] = { "npc/overwatch/cityvoice/f_protectionresponse_1_spkr.wav", "Attention protection team: status evasion in progress in this community. Respond, isolate, inquire." },
	[14] = { "npc/overwatch/cityvoice/f_rationunitsdeduct_3_spkr.wav", "Attention occupants: your block is now charged with permissive inactive coersion. Five ration units deducted." },
	[15] = { "npc/overwatch/cityvoice/f_sociolevel1_4_spkr.wav", "Individual: you are charged with socioendangerment level one. Protection units, prosecution code: duty, sword, midnight." },
	[16] = { "npc/overwatch/cityvoice/f_trainstation_assemble_spkr.wav", "Citizen notice: priority identification check in progress. Please assemble in your designated inspection positions." },
	[17] = { "npc/overwatch/cityvoice/f_trainstation_assumepositions_spkr.wav", "Attention, please. All citizens in local residential block, assume your inspection positions." },
	[18] = { "npc/overwatch/cityvoice/f_trainstation_cooperation_spkr.wav", "Attention, residents. Miscount detected in your block. Cooperation with your civil protection team permits full ration reward." },
	[19] = { "npc/overwatch/cityvoice/f_trainstation_inform_spkr.wav", "Attention, residents. This block contains potential civil infection. Inform, cooperate, assemble." },
	[20] = { "npc/overwatch/cityvoice/f_trainstation_offworldrelocation_spkr.wav", "Citizen notice: failure to cooperate will result in permanent offworld relocation." },
	[21] = { "npc/overwatch/cityvoice/f_unrestprocedure1_spkr.wav", "Attention, community: unrest procedure code is now in effect. Inoculate, shield, pacify. Code: pressure, sword, sterilize." },
}

if CLIENT then
    netstream.Hook("PlayDispatchVoiceLine", function(data)
        surface.PlaySound(GAMEMODE.DispatchVoicelines[data.Index][1])
    end)
end

if SERVER then
    netstream.Hook("PlayDispatchVoiceLineRequest", function(ply, data)
        if not ply:IsAdmin() and not ply:HasCombinePermission(COMBINE_ADMINS_DISPATCH) then
            return
        end

        if not GAMEMODE.DispatchVoicelines[data.Index] then
            return
        end

        netstream.Send("PlayDispatchVoiceLine", {
            Index = data.Index
        })
    end)
end