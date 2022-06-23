ITEM = class.Create("base_combine")

ITEM.Name 				= "Overwatch Special Operations P.C.V."
ITEM.Description 		= "A special of Powered Combat Armor for special units."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Species 			= {SPECIES_CMB_SOLDIER}

ITEM.ArmorOverride		= true
ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.Filtered 			= true

ITEM.Secure 			= true

function ITEM:OnUnequip(ply, slot, unloading)
	ply:SetVISR(false)
	ply:SetCloakState(false)
	ply:SetCloakStart(-math.huge)

	self:ParentCall("OnUnequip", ply, slot, unloading)
end

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle Overwatch NVG",
		Callback = function()
			ply:SetVISR(not ply:VISR())
		end
	})

	table.insert(tab, {
		Name = "Toggle Suit Emitters",
		Callback = function()
			ply:SetCloakState(not ply:CloakState())
			ply:SetCloakStart(CurTime())
		end
	})

	return tab
end

if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/tnb/combine/specops.mdl"),
				Skin = 0,
				Bodygroups = { }
			}
		}
	end
end

-- All the big stuff

accessor.Player("CloakState", false, ACCESSOR_SHARED)
accessor.Player("CloakStart", -math.huge, ACCESSOR_SHARED)

accessor.Global("CloakMax", 0.99)
accessor.Global("CloakMaxAlt", 0.9)

function GAMEMODE:GetCloakVal(ply)
	local max = self:CloakMax()

	if CLIENT then
		local lp = LocalPlayer()

		if lp:GetViewEntity() == ply or (lp:HasCloak() and lp != ply) then
			max = self:CloakMaxAlt()
		end
	end

	local val = math.Clamp(CurTime() - ply:CloakStart(), 0, max)

	if ply:CloakState() then
		return val
	else
		return max - val
	end
end

if CLIENT then
	matproxy.Add({
		name = "PlayerCloak",
		init = function(self, mat, values)
			self.Target = values.resultvar
		end,
		bind = function(self, mat, ent)
			if not IsValid(ent) then
				return
			end

			if ent:IsWeapon() then
				ent = ent.Owner
			elseif ent:IsRagdoll() then
				ent = ent:GetRagdollOwner()
			end

			if not IsValid(ent) or not ent:IsPlayer() then
				mat:SetFloat(self.Target, 0)

				return
			end

			mat:SetFloat(self.Target, GAMEMODE:GetCloakVal(ent))
		end
	})
end

return ITEM
