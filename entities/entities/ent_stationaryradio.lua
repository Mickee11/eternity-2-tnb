AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Stationary Radio"
ENT.Category 		= "Eternity.Common Entities"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_lab/citizenradio.mdl")

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)
    end
    
    self:SetFrequency(1)
    self:SetTalkable(0)
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")
    self:NetworkVar("Int", 1, "Frequency")
    self:NetworkVar("Int", 2, "Talkable")
end

function ENT:GetCustomData()
	return {
        Frequency = self:GetFrequency(),
        Talkable = self:GetTalkable()
	}
end

function ENT:LoadCustomData(data)
    self:SetFrequency(data.Frequency)
    self:SetTalkable(data.Talkable)
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

    if not ply:IsInEditMode() or self:IsReady() or not interact then
        table.insert(tab, {
            SubMenu = "Stationary Radio",
            Name = "Set Radio Frequency",
            Client = function()
                return GAMEMODE:OpenGUI("Input", "number", "Set Radio Frequency", {
                    Default = self:GetFrequency()
                })
            end,
            Callback = function(val)
                self:SetFrequency(math.Clamp(math.Round(val), 1, 999))

                self:Save()
    
                ply:VisibleMessage(string.format("%s sets the radio's frequency to %d MHz.", ply:VisibleRPName(), self:GetFrequency()))
            end
        })

		return tab
    end
    
    table.insert(tab, {
        SubMenu = "Stationary Radio",
        Name = "Set Radio Frequency",
        Client = function()
            return GAMEMODE:OpenGUI("Input", "number", "Set Radio Frequency", {
                Default = self:GetFrequency()
            })
        end,
        Callback = function(val)
            if not ply:IsAdmin() then
                self:SetFrequency(math.Clamp(math.Round(val), 1, 999))
            else
                self:SetFrequency(math.Clamp(math.Round(val), 1, 10000))
            end

            ply:VisibleMessage(string.format("%s sets the radio's frequency to %d MHz.", ply:VisibleRPName(), self:GetFrequency()))
        end
    })

    if self:GetTalkable() == 0 then
        table.insert(tab, {
            EditModeOnly = true,
            Name = "Allow Voice Input",
            Callback = function(val)
                self:SetTalkable(1)
            end
        })
    elseif self:GetTalkable() == 1 then
        table.insert(tab, {
            EditModeOnly = true,
            Name = "Deny Voice Input",
            Callback = function(val)
                self:SetTalkable(0)
            end
        })
    end

	return tab
end

function ENT:CanHearFrequency(freq, key)
    local hear = false
    local clear = false

    if not self:IsReady() then
        hear = false
        clear = false
    else
        if self:GetFrequency() == freq then
            hear = true

            if not key then
                clear = true
            end
        end
    end

    return hear, clear
end