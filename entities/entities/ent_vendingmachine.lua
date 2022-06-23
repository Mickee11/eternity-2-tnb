AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_BOTH

ENT.PrintName 		= "Vending Machine"
ENT.Category 		= "Eternity.Common Entities"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_interiors/VendingMachineSoda01a.mdl")
ENT.LightMat 		= Material("particle/fire")

ENT.DispenseItems = {
	"food_breenwater"
}

ENT.Sounds = {
	Use = Sound("Buttons.snd1"),
	Dispense = Sound("Buttons.snd4"),
	NoMoney = Sound("Buttons.snd10")
}

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_VPHYSICS)
		self:SetMoveType(MOVETYPE_VPHYSICS)
		self:SetSolid(SOLID_VPHYSICS)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end

		self:SetUseType(SIMPLE_USE)
	end
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("Float", 0, "Delay")
end

if CLIENT then
	function ENT:Draw()
		self:DrawModel()

		render.SetMaterial(self.LightMat)

		local r = Color(255, 23, 23)
		local g = Color(0, 255, 0)

		local pos = Vector(17.8, 24.25, 5)

		for i = 0, 7 do
			if i == 3 or i == 4 or i == 7 then
				render.DrawSprite(self:LocalToWorld(pos + Vector(0, 0, -2 * i)), 4, 4, g)
			else
				render.DrawSprite(self:LocalToWorld(pos + Vector(0, 0, -2 * i)), 4, 4, r)
			end
		end

		pos.z = -1
	end
end

if SERVER then
	function ENT:Use(ply)
		if not self:IsReady() then
			return
		end

		if self:GetDelay() > CurTime() then
			return
		end

		self:SetDelay(CurTime() + 1)

		if not ply:HasMoney(10) then
			ply:SendChat("ERROR", "The vending machine requires 10 credits in the coin slot.")

			self:EmitSound(self.Sounds.NoMoney)

			return
		end

		ply:TakeMoney(10)
		ply:SendChat("NOTICE", "You insert ten credits into the vending machine.")

		self:EmitSound(self.Sounds.Use)

		timer.Simple(1, function()
			if not IsValid(self) then
				return
			end

			local pos = self:LocalToWorld(Vector(16, -6, -24))
			local ang = self:LocalToWorldAngles(Angle(0, 0, 90))

			coroutine.WrapFunc(function()
				local item = GAMEMODE:CreateItem(table.Random(self.DispenseItems))

				item:SetNetworked(true)
				item:SetWorldItem(pos, ang)

				if IsValid(self) then
					self:EmitSound(self.Sounds.Dispense)
				end
			end)
		end)

		self:Save()
	end
end