ITEM = class.Create("base_xenian")

ITEM.Name 				= "Gargantua"
ITEM.Description 		= "A massive, hulking creature you ought not mess with."

ITEM.Model 				= Model("models/stukabat_acid.mdl")
ITEM.Color 				= Color(0, 161, 255)

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/garg/gar_alert1.wav",
		"npc/garg/gar_alert2.wav",
		"npc/garg/gar_alert3.wav"
	},
		["Attack"] = {
		"npc/garg/gar_attack1.wav",
		"npc/garg/gar_attack2.wav",
		"npc/garg/gar_attack3.wav"
	},
		["Breathe"] = {
		"npc/garg/gar_breathe1.wav",
		"npc/garg/gar_breathe2.wav",
		"npc/garg/gar_breathe3.wav"
	},
		["Death"] = {
		"npc/garg/gar_die1.wav",
		"npc/garg/gar_die2.wav"
	},
		["Idle"] = {
		"npc/garg/gar_idle1.wav",
		"npc/garg/gar_idle2.wav",
		"npc/garg/gar_idle3.wav",
		"npc/garg/gar_idle4.wav",
		"npc/garg/gar_idle5.wav"
	},
		["Pain"] = {
		"npc/garg/gar_pain1.wav",
		"npc/garg/gar_pain2.wav",
		"npc/garg/gar_pain3.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 60, 300, 215, 60
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/gargantua.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/garg/gar_step1.wav" or "npc/garg/gar_step2.wav"
	end
end

return ITEM
