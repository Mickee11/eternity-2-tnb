AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_BOTH

ENT.PrintName 		= "Transition: Local Area"
ENT.Category 		= "Eternity.Zone Tools"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/hunter/blocks/cube025x025x025.mdl")
ENT.Color 			= Color(255, 127, 223)

function ENT:SpawnFunction(ply, tr, class)
	if #ents.FindByClass(class) > 0 then
		ply:SendChat("ERROR", "This entity can't be spawned more than once!")

		return
	end

	return BaseClass.SpawnFunction(self, ply, tr, class)
end

function ENT:SetupDataTables()
    self:NetworkVar("Int", 0, "EntityID")
    self:NetworkVar("Int", 1, "Transition")
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
    
    self:SetTransition(WORLDAREA_NONE)
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not interact or not ply:IsInEditMode() then
		return tab
	end

	if self:CanSave() then
        for k,v in pairs(WORLDAREAS) do
            table.insert(tab, {
				EditModeOnly = true,
                Name = "Set World Area: " .. v.Fancy,
                Callback = function()
					self:SetTransition(k)
					
					GAMEMODE:SetWorldArea(k)

					self:Save()
                end
            })
        end
	end

	return tab
end

function ENT:GetWorldArea()
    return self:GetTransition()
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

			GAMEMODE:DrawWorldText(self:WorldSpaceCenter(), string.format("%s: %s", self.PrintName, WORLDAREAS[self:GetTransition()].Fancy), true)
		end
	end
else
    function ENT:GetCustomData()
		return {
            Transition = self:GetTransition(),
		}
	end

    function ENT:LoadCustomData(data)
		self:SetTransition(data.Transition)
		
		GAMEMODE:SetWorldArea(data.Transition)
	end
end