AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 					= "ent_worldent"
ENT.RenderGroup 			= RENDERGROUP_BOTH

ENT.PrintName 				= "Item Container"
ENT.Category 				= "Eternity.Common Entities"

ENT.Spawnable 				= false
ENT.AdminOnly 				= true

ENT.Model 					= Model("models/Items/ammocrate_smg1.mdl")

ENT.InventorySize 			= {10, 6}

ENT.Sounds = {
	Open = Sound("AmmoCrate.Open"),
	Close = Sound("AmmoCrate.Close")
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

	self:ResetSequence("close")
	self:SetSubMaterial(1, "null")
end

function ENT:SetupDataTables()
	self:NetworkVar("Int", 0, "EntityID")

	self:NetworkVar("Bool", 0, "Open")
	self:NetworkVar("Bool", 1, "Locked")
end

function ENT:CanAccessInventory(ply)
	return self:WithinInteractRange(ply) and self:GetOpen()
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not interact then
		return tab
	end

	if self:IsReady() then
		if not self:GetOpen() then
			local data = {
				SubMenu = "Container",
				Name = "Open",
				Callback = function(val)
					if self:GetLocked() and not ply:IsAdmin() then
						if not val then
							return
						end

						if not GAMEMODE:CheckInput("string", {
							Max = 30
						}, val) then
							return
						end

						if self.Password != val then
							return
						end
					end

					self:EmitSound(self.Sounds.Open)
					self:ResetSequence("open")

					self:SetOpen(true)
				end
			}

			if self:GetLocked() and not ply:IsAdmin() then
				data.Client = function()
					return GAMEMODE:OpenGUI("Input", "string", "Unlock Container", {
						Max = 30
					})
				end
			end

			table.insert(tab, data)
		else
			table.insert(tab, {
				SubMenu = "Container",
				Name = "Close",
				Callback = function()
					self:EmitSound(self.Sounds.Close)
					self:ResetSequence("close")

					self:SetOpen(false)
				end
			})
		end
	elseif ply:IsInEditMode() then
		table.insert(tab, {
            EditModeOnly = true,
			Name = "Set Password",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Password", {
					Max = 30
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 30
				}, val) then
					return
				end

				self:SetLocked(true)
				self.Password = val
			end
		})
		table.insert(tab, {
            EditModeOnly = true,
			Name = "Clear Password",
			Callback = function()
				self:SetLocked(false)
				self.Password = nil
			end
		})
		table.insert(tab, {
            EditModeOnly = true,
			Name = "Set Model",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Model", {
					Max = 128
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = 128
				}, val) then
					return
				end

				self:SetModel(val)
				self.CustomModel = val

				self:PhysicsInit(SOLID_VPHYSICS)
				self:SetMoveType(MOVETYPE_VPHYSICS)
				self:SetSolid(SOLID_VPHYSICS)
		
				local phys = self:GetPhysicsObject()
		
				if IsValid(phys) then
					phys:Wake()
					phys:EnableMotion(false)
				end
		
				self:SetUseType(SIMPLE_USE)
			end
		})
		table.insert(tab, {
            EditModeOnly = true,
			Name = "Set Inventory Width",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "number", "Set Inventory Width", {
					Default = self.InventorySize[1]
				})
			end,
			Callback = function(val)
				val = math.Clamp(math.Round(val), 1, 30)

				self.InventorySizeWidth = val
			end
		})
		table.insert(tab, {
            EditModeOnly = true,
			Name = "Set Inventory Height",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "number", "Set Inventory Height", {
					Default = self.InventorySize[2]
				})
			end,
			Callback = function(val)
				val = math.Clamp(math.Round(val), 1, 30)

				self.InventorySizeHeight = val
			end
		})
	end

	return tab
end

if SERVER then
	function ENT:Use(ply)
		if not self:IsReady() or not self:GetOpen() then
			return
		end

		local inventory = GAMEMODE:GetInventoryByType(STORE_CONTAINER, self:GetEntityID(), "Main")

		ply:OpenGUI("InventoryPopup", "Container", {inventory.NetworkID})
	end

	function ENT:OnInitialLoad()
		local width = self.InventorySize[1]
		local height = self.InventorySize[2]

		if self.InventorySizeWidth then
			width = self.InventorySizeWidth
		end

		if self.InventorySizeHeight then
			height = self.InventorySizeHeight
		end

		GAMEMODE:CreateGrid(STORE_CONTAINER, self:GetEntityID(), "Main", width, height, false, true):SetNetworked(true)
	
		if self.CustomModel then
			self:SetModel(self.CustomModel)

			self:PhysicsInit(SOLID_VPHYSICS)
			self:SetMoveType(MOVETYPE_VPHYSICS)
			self:SetSolid(SOLID_VPHYSICS)
	
			local phys = self:GetPhysicsObject()
	
			if IsValid(phys) then
				phys:Wake()
				phys:EnableMotion(false)
			end
	
			self:SetUseType(SIMPLE_USE)
		end
	end

	function ENT:GetCustomData()
		return {
			Password = self.Password,
			InventorySizeWidth = self.InventorySizeWidth,
			InventorySizeHeight = self.InventorySizeHeight,
			CustomModel = self.CustomModel
		}
	end

	function ENT:LoadCustomData(data)
		self.Password = data.Password

		if self.Password then
			self:SetLocked(true)
		end

		self.InventorySizeWidth = data.InventorySizeWidth
		self.InventorySizeHeight = data.InventorySizeHeight
		self.CustomModel = data.CustomModel
	end
end
