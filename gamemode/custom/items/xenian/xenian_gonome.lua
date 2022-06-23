ITEM = class.Create("base_xenian")

ITEM.Name 				= "Gonome"
ITEM.Description 		= "Xenian-117."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Attack"] = {"npc/gonome/gonome_jumpattack.wav",
		"npc/gonome/gonome_melee1.wav",
		"npc/gonome/gonome_melee2.wav"
	},
	["Death"] = {
		"npc/gonome/gonome_death2.wav",
		"npc/gonome/gonome_death3.wav",
		"npc/gonome/gonome_death4.wav"
	},
	["Eat"] = "npc/gonome/gonome_eat.wav",
	["Idle"] = {
		"npc/gonome/gonome_idle1.wav",
		"npc/gonome/gonome_idle2.wav",
		"npc/gonome/gonome_idle3.wav"
	},
	["Injured"] = {
		"npc/gonome/gonome_pain1.wav",
		"npc/gonome/gonome_pain2.wav",
		"npc/gonome/gonome_pain3.wav",
		"npc/gonome/gonome_pain4.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 100, 350, 275, 100
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/opfor/gonome.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "npc/voltigore/voltigore_footstep1.wav" or "npc/voltigore/voltigore_footstep2.wav", 0.1
		end

		return "npc/voltigore/voltigore_footstep1.wav", 0
	end
end

return ITEM
