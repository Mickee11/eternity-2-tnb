AddCSLuaFile()
DEFINE_BASECLASS("ent_worldent")

ENT.Base 			= "ent_worldent"
ENT.RenderGroup 	= RENDERGROUP_OPAQUE

ENT.PrintName 		= "Ration Dispenser"
ENT.Category 		= "Eternity.Half-Life"

ENT.Spawnable 		= false
ENT.AdminOnly 		= true

ENT.Model 			= Model("models/props_combine/combine_dispenser.mdl")

ENT.RationTypes     = {
    ["rationparcel_lowquality"] = COMBINE_RATION_LOWQUALITY,
    ["rationparcel_highquality"] = COMBINE_RATION_HIGHQUALITY,
    ["rationparcel_elevated"] = COMBINE_RATION_ELEVATED,
    ["rationparcel_standard"] = COMBINE_RATION_STANDARD
}

function ENT:Initialize()
	self:SetModel(self.Model)

	if SERVER then
		self:PhysicsInit(SOLID_BBOX)
		self:SetMoveType(MOVETYPE_VPHYSICS)
        self:SetSolid(SOLID_BBOX)

		local phys = self:GetPhysicsObject()

		if IsValid(phys) then
			phys:Wake()
		end
	end

	self:DrawShadow(false)
    self:SetCollisionGroup(COLLISION_GROUP_WORLD)
end

function ENT:Think()
	self:RemoveAllDecals()
end

function ENT:GetContextOptions(ply, interact)
	local tab = BaseClass.GetContextOptions(self, ply, interact)

	if not self:IsReady() or not interact then
		return tab
    end

    -- 1.5 hours per ration.
    table.insert(tab, {
        SubMenu = "Ration Dispenser",
        Name = "Collect Ration",
        Callback = function()
            local rationtime = (ply:LastRationTime() + 5400) - os.time() 

            if rationtime > 0 then
                ply:SendChat("ERROR", string.format("The machine buzzes. You must wait another %s before getting another.", string.NiceTime(rationtime)))
                self:EmitSound("buttons/button10.wav", 65)
                
                return
            end

            local type = nil

            for k,v in pairs(self.RationTypes) do
                if ply:HasCombinePermission(v) then
                    type = k

                    break
                end
            end

            if type == nil then
                ply:SendChat("ERROR", "The machine buzzes. You shouldn't be getting one of these.")
                self:EmitSound("buttons/button10.wav", 65)

                return
            end

            ply:GiveItem(type, 1, nil, function(item)
                item:CreateInventory()

                return item
            end)

            GAMEMODE:WriteLog("combine_ration", {
                Ply = GAMEMODE:LogPlayer(ply),
                Char = GAMEMODE:LogCharacter(ply),
            })

            ply:SetLastRationTime(os.time())

            self:EmitSound("buttons/lever8.wav")
            self:Animate()
        end
    })

    if ply:HasItem("currency_vouchers", 1) then
        table.insert(tab, {
            SubMenu = "Ration Dispenser",
            Name = "Use Voucher",
            Callback = function()
                ply:SendChat("NOTICE", "You trade your ration ticket for a standard-issue parcel.")
                ply:TakeItem("currency_vouchers", 1)

                ply:GiveItem("rationparcel_standard", 1, nil, function(item)
                    item:CreateInventory()
    
                    return item
                end)

                self:Animate()
            end
        })
    end

	return tab
end

if SERVER then
	function ENT:OnInitialLoad()
		self:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
    end
    
    function ENT:Animate()
        self:ResetSequence("dispense_package")
    end
end