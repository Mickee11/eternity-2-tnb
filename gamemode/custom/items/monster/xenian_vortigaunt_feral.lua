ITEM = class.Create("base_monster")

ITEM.Name 				= "Feral Vortigaunt"
ITEM.Description 		= "Much less friendly that your standard Vortigaunt."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/aslave/slv_alert1.wav",
		"npc/aslave/slv_alert2.wav",
		"npc/aslave/slv_alert3.wav"
	},
	["Die"] = {
		"npc/aslave/slv_die1.wav",
		"npc/aslave/slv_die2.wav"
	},
	["Pain"] = {
		"npc/aslave/slv_pain1.wav",
		"npc/aslave/slv_pain2.wav"
	},
	["Chatter"] = {
		"npc/aslave/slv_word1.wav",
		"npc/aslave/slv_word2.wav",
		"npc/aslave/slv_word3.wav",
		"npc/aslave/slv_word4.wav",
		"npc/aslave/slv_word5.wav",
		"npc/aslave/slv_word6.wav",
		"npc/aslave/slv_word7.wav",
		"npc/aslave/slv_word8.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 55, 220, 210, 55
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/islave.mdl"),
				Bodygroups = {
					collar = 1
				}
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "NPC_Vortigaunt.FootstepLeft" or "NPC_Vortigaunt.FootstepRight", 0.1
		end
	end
end

return ITEM
