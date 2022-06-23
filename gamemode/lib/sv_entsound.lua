local entities = entities or {}

_G.ENTSOUND_IDLE = "idle"
_G.ENTSOUND_ACTION = "action"

local function IsValidEntSoundEntity(ent)
    return IsEntity(ent) and IsValid(ent)
end

local function GetEntSoundCache(ent)
    assert(IsValidEntSoundEntity(ent), "Attempted to load sound cache for invalid entity: " .. tostring(ent))

    local cache = entities[ent:EntIndex()]

    if not cache then
        entities[ent:EntIndex()] = {}

        return {}
    end
    
    return cache
end

local function IsEntSoundCacheDataSaved(ent, tag)
    assert(IsValidEntSoundEntity(ent), "Attempted to check sound cache for invalid entity: " .. tostring(ent))

    return GetEntSoundCache(ent)[tag] ~= nil
end

local function SaveEntSoundCacheData(ent, tag, data)
    assert(IsValidEntSoundEntity(ent), "Attempted to save sound cache for invalid entity: " .. tostring(ent))

    entities[ent:EntIndex()][tag] = data
end

local function DeleteEntSoundCacheData(ent, tag)
    assert(IsValidEntSoundEntity(ent), "Attempted to delete sound cache for invalid entity:" .. tostring(ent))

    entities[ent:EntIndex()][tag] = nil
end

local function GetEntSoundData(ent, tag, source, volume, pitch)
    assert(IsValidEntSoundEntity(ent), "Attempted to get sound data for invalid entity: " .. tostring(ent))

    if IsEntSoundCacheDataSaved(ent, tag) then
        local data = GetEntSoundCache(ent)[tag]

        if source == nil then
            return data
        end

        if data.SoundPatch:IsPlaying() then
            data.SoundPatch:Stop()
        end

        DeleteEntSoundCacheData(ent, tag)
    end

    if not source then
        return nil
    end

    local filter = nil
    
    if SERVER then
        filter = RecipientFilter()
        filter:AddAllPlayers()
    end
    
    local data = {
        SoundPatch = CreateSound(ent, Sound(source), filter),
        Volume = volume or 1,
        Pitch = pitch or 100
    }

    assert(data.SoundPatch, "Failed to create new CSoundPatch object data for " .. tostring(ent))

    SaveEntSoundCacheData(ent, tag, data)

    return data
end

module("entsound", package.seeall)

function Play(ent, tag, source, volume, pitch)
    assert(IsValidEntSoundEntity(ent), "Attempted to play CSoundPatch stream for invalid entity: " .. tostring(ent))

    local data = GetEntSoundData(ent, tag, source, volume, pitch)

    if not data then
        return
    end

    if data.SoundPatch:IsPlaying() then
        data.SoundPatch:Stop()
    end

    data.SoundPatch:PlayEx(data.Volume, data.Pitch)
end

function Stop(ent, tag)
    assert(IsValidEntSoundEntity(ent), "Attempted to stop CSoundPatch stream for invalid entity: " .. tostring(ent))

    if not IsEntSoundCacheDataSaved(ent, tag) then
        return
    end

    local data = GetEntSoundData(ent, tag)
    
    if data.SoundPatch:IsPlaying() then
        data.SoundPatch:Stop()
    end
end

function Delete(ent, tag)
    assert(IsValidEntSoundEntity(ent), "Attempted to delete CSoundPatch stream for invalid entity: " .. tostring(ent))

    entsound.Stop(ent, tag)

    DeleteEntSoundCacheData(ent, tag)
end

function Silence(ent)
    assert(IsValidEntSoundEntity(ent), "Attempted to silence CSoundPatch streams for invalid entity: " .. tostring(ent))

    for k,v in pairs(GetEntSoundCache(ent)) do
        if v.SoundPatch:IsPlaying() then
            v.SoundPatch:Stop()
        end
    end
end

function Clear(ent)
    assert(IsValidEntSoundEntity(ent), "Attempted to clear CSoundPatch streams for invalid entity: " .. tostring(ent))

    for k,v in pairs(GetEntSoundCache(ent)) do
        entsound.Delete(ent, k)
    end
end
