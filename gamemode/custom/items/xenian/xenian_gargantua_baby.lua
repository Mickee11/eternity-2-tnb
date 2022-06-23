ITEM = class.Create("base_xenian")

ITEM.Name 				= "Baby Gargantua"
ITEM.Description 		= "A slightly smaller but still hulking creature you ought not mess with."

ITEM.Model 				= Model("models/stukabat_acid.mdl")
ITEM.Color 				= Color(127, 0, 0)

ITEM.ArmorLevel			= ARMOR_SUPER

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/babygarg/gar_alert1.wav",
		"npc/babygarg/gar_alert2.wav",
		"npc/babygarg/gar_alert3.wav"
	},
		["Attack"] = {
		"npc/babygarg/gar_attack1.wav",
		"npc/babygarg/gar_attack2.wav",
		"npc/babygarg/gar_attack3.wav"
	},
		["Breathe"] = {
		"npc/babygarg/gar_breathe1.wav",
		"npc/babygarg/gar_breathe2.wav",
		"npc/babygarg/gar_breathe3.wav"
	},
		["Death"] = {
		"npc/babygarg/gar_die1.wav",
		"npc/babygarg/gar_die2.wav"
	},
		["Idle"] = {
		"npc/babygarg/gar_idle1.wav",
		"npc/babygarg/gar_idle2.wav",
		"npc/babygarg/gar_idle3.wav",
		"npc/babygarg/gar_idle4.wav",
		"npc/babygarg/gar_idle5.wav"
	},
		["Pain"] = {
		"npc/babygarg/gar_pain1.wav",
		"npc/babygarg/gar_pain2.wav",
		"npc/babygarg/gar_pain3.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 60, 300, 215, 60
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/babygarg.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/babygarg/gar_step1.wav" or "npc/babygarg/gar_step2.wav"
	end
end

return ITEM
