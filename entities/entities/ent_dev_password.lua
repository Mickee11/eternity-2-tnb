AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_BOTH

ENT.PrintName 		= "Server Password"
ENT.Category 		= "Eternity.Developer Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/hunter/blocks/cube025x025x025.mdl")
ENT.Color 			= Color(0, 255, 0)

function ENT:SpawnFunction(ply, tr, class)
    if not ply:IsDeveloper() then
        ply:SendChat("ERROR", "Only developers may spawn this entity!")

        return
    end

    local existing = ents.FindByClass(class)
	if existing then
        existing[1]:Remove()
	end

	return BaseClass.SpawnFunction(self, ply, tr, class)
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "EntityID")
    
    self:NetworkVar("String", 0, "Password")
end

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:EnableMotion(false)
		end
	end

	self:DrawShadow(false)
	self:SetCollisionGroup(COLLISION_GROUP_WORLD)

    self:SetMaterial("models/shiny")
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not interact or not ply:IsInEditMode() then
		return tab
	end

    if ply:IsDeveloper() then
        table.insert(tab, {
            EditModeOnly = true,
            Name = "Remove Password",
            Callback = function()
                game.ConsoleCommand("sv_password \"\"\n")
                self:SetPassword("")
            end
        })
        table.insert(tab, {
            EditModeOnly = true,
            Name = "Set Server Password",
            Client = function()
                return GAMEMODE:OpenGUI("Input", "string", "Set Server Password", {
                    Default = self:GetPassword(),
                    Max = 32
                })
            end,
            Callback = function(val)
                val = string.Trim(val)
                
                if not GAMEMODE:CheckInput("string", {
                    Max = 32
                }, val) then
                    return
                end

                if #string.Trim(val) < 1 then
                    return
                end

                self:SetPassword(val)

                game.ConsoleCommand(string.format("sv_password %s\n", val))

                self:Save()
            end
        })
    end

	return tab
end

if CLIENT then
	function ENT:Draw()
		local edit = LocalPlayer():IsInEditMode()
		local ready = self:IsReady()

		if edit or not ready then
			self:DrawModel()

			local mins = self:OBBMins() - Vector(0.1, 0.1, 0.1)
			local maxs = self:OBBMaxs() + Vector(0.1, 0.1, 0.1)

			render.SetColorMaterial()
			render.DrawBox(self:GetPos(), self:GetAngles(), mins, maxs, ColorAlpha(self.Color, 50), true)

			GAMEMODE:DrawWorldText(self:WorldSpaceCenter(), string.format("%s: %s", self.PrintName, self:GetPassword()), true)
		end
	end
else
    function ENT:GetCustomData()
		return {
            Password = self:GetPassword(),
		}
	end

    function ENT:LoadCustomData(data)
        self:SetPassword(data.Password)

        if #string.Trim(data.Password) < 1 then
            return
        end

        game.ConsoleCommand(string.format("sv_password %s\n", data.Password))
	end
end