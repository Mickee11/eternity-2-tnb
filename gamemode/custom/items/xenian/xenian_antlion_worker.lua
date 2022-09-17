ITEM = class.Create("base_monster")

ITEM.Name 				= "Antlion Worker"
ITEM.Description 		= "Spits some green acid in the game, but not here. We're lazy here."

ITEM.Model 				= Model("models/gibs/antlion_worker_gibs_head.mdl")

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Voicelines 	= {
	["Distract"] = "npc/antlion/distract1.wav",
	["Idle"] = {
		"npc/antlion/idle1.wav",
		"npc/antlion/idle2.wav",
		"npc/antlion/idle3.wav",
		"npc/antlion/idle4.wav",
		"npc/antlion/idle5.wav"
	},
	["Scream"] = {
		"npc/antlion/antlion_preburst_scream1.wav",
		"npc/antlion/antlion_preburst_scream2.wav"
	},
	["Die"] = {
		"npc/antlion/antlion_burst1.wav",
		"npc/antlion/antlion_burst2.wav"
	}
}

function ITEM:OnEquip(ply, slot, loading)
	self:ParentCall("OnEquip", ply, slot, loading)

	if SERVER then
		ply:SetBloodColor(BLOOD_COLOR_ANTLION_WORKER)
	end
end

function ITEM:OnUnequip(ply, slot, unloading)
	self:ParentCall("OnUnequip", ply, slot, unloading)

	if SERVER then
		ply:SetBloodColor(BLOOD_COLOR_RED)
	end

	ply:StopSound("antlion_flight_loop")
	ply:StopSound("antlion_flight_land")
end

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 195, 355, 410, 90
	end

	function ITEM:Loadout(ply)
		ply:Give("eternity_xen_antlion_worker")
	end

	function ITEM:OnDeath(ply)
		ply:StopSound("antlion_flight_loop")
		ply:StopSound("antlion_flight_land")
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/antlion_worker.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "NPC_Antlion.Footstep"
	end
end

return ITEM
