ITEM = class.Create("base_xenian")

ITEM.Name 				= "Zombine"
ITEM.Description 		= "Someone's having a bad day."

ITEM.Model 				= Model("models/gibs/hgibs.mdl")

ITEM.ArmorLevel			= ARMOR_SUPER

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/zombine/zombine_alert1.wav",
		"npc/zombine/zombine_alert2.wav",
		"npc/zombine/zombine_alert3.wav",
		"npc/zombine/zombine_alert4.wav",
		"npc/zombine/zombine_alert5.wav",
		"npc/zombine/zombine_alert6.wav",
		"npc/zombine/zombine_alert7.wav"
	},
	["Charge"] = {
		"npc/zombine/zombine_charge1.wav",
		"npc/zombine/zombine_charge2.wav"
	},
	["Die"] = {
		"npc/zombine/zombine_die1.wav",
		"npc/zombine/zombine_die2.wav"
	},
	["Idle"] = {
		"npc/zombine/zombine_idle1.wav",
		"npc/zombine/zombine_idle2.wav",
		"npc/zombine/zombine_idle3.wav",
		"npc/zombine/zombine_idle4.wav"
	},
	["Pain"] = {
		"npc/zombine/zombine_pain1.wav",
		"npc/zombine/zombine_pain2.wav",
		"npc/zombine/zombine_pain3.wav",
		"npc/zombine/zombine_pain4.wav"
	},
	["Grenade"] = {
		"npc/zombine/zombine_readygrenade1.wav",
		"npc/zombine/zombine_readygrenade2.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 35, 193, 210, 35
	end

	function ITEM:Loadout(ply)
		ply:Give("eternity_xen_zombine")
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/zombie/zombie_soldier.mdl"),
				Bodygroups = {
					headcrab1 = 1
				}
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return "npc/zombine/gear" .. math.random(1, 3) .. ".wav", 0.1
		end
	end
end

return ITEM
