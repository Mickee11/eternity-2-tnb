ITEM = class.Create("base_xenian")

ITEM.Name 				= "Houndeye"
ITEM.Description 		= "The real good boy. Bark bark."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/houndeye/he_alert1.wav",
		"npc/houndeye/he_alert2.wav",
		"npc/houndeye/he_alert3.wav"
	},
	["Attack"] = {
		"npc/houndeye/he_attack1.wav",
		"npc/houndeye/he_attack2.wav",
		"npc/houndeye/he_attack3.wav"
	},
	["Death"] = {
		"npc/houndeye/he_die2.wav",
		"npc/houndeye/he_die3.wav"
	},
	["Idle"] = {
		"npc/houndeye/he_idle1.wav",
		"npc/houndeye/he_idle4.wav"
	},
	["Pain"] = {
		"npc/houndeye/he_pain1.wav",
		"npc/houndeye/he_pain4.wav",
		"npc/houndeye/he_pain5.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 55, 300, 210, 55
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/houndeye.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/chumtoad/toad_hunt2.wav" or "npc/chumtoad/toad_hunt3.wav", 0
	end
end

return ITEM
