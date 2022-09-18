ITEM = class.Create("base_monster")

ITEM.Name 				= "Alien Grunt"
ITEM.Description 		= "At least the gun chose his hand, not Freeman's."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.ArmorLevel			= ARMOR_SUPER

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/agrunt/ag_alert1.wav",
		"npc/agrunt/ag_alert2.wav",
		"npc/agrunt/ag_alert3.wav",
		"npc/agrunt/ag_alert4.wav",
		"npc/agrunt/ag_alert5.wav"
	},
	["Attack"] = {
		"npc/agrunt/ag_attack1.wav",
		"npc/agrunt/ag_attack2.wav",
		"npc/agrunt/ag_attack3.wav"
	},
	["Death 1"] = {
		"npc/agrunt/ag_die1.wav",
		"npc/agrunt/ag_die2.wav",
		"npc/agrunt/ag_die3.wav",
		"npc/agrunt/ag_die4.wav",
		"npc/agrunt/ag_die5.wav"
	},
	["Idle"] = {
		"npc/agrunt/ag_idle1.wav",
		"npc/agrunt/ag_idle2.wav",
		"npc/agrunt/ag_idle3.wav",
		"npc/agrunt/ag_idle4.wav",
		"npc/agrunt/ag_idle5.wav"
	},
	["Pain"] = {
		"npc/agrunt/ag_pain1.wav",
		"npc/agrunt/ag_pain2.wav",
		"npc/agrunt/ag_pain3.wav",
		"npc/agrunt/ag_pain4.wav",
		"npc/agrunt/ag_pain5.wav"
	}
}

function ITEM:GetSpeeds(ply)
		return 70, 300, 275, 70
	end

if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/agrunt.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		local audio = 0.5

		if walking then
			audio = 0.25
		end

		return step and "npc/agrunt/ag_step1.wav" or "npc/agrunt/ag_step2.wav", audio
	end
end

return ITEM
