ITEM = class.Create("base_monster")

ITEM.Name 				= "Alien Controller"
ITEM.Description 		= "Floating, floating. Not much else to say or do."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/controller/con_alert1.wav",
		"npc/controller/con_alert2.wav",
		"npc/controller/con_alert3.wav"
	},
	["Attack"] = {
		"npc/controller/con_attack1.wav",
		"npc/controller/con_attack2.wav",
		"npc/controller/con_attack3.wav"
	},
	["Death"] = {
		"npc/controller/con_die1.wav",
		"npc/controller/con_die2.wav"
	},
	["Idle"] = {
		"npc/controller/con_idle1.wav",
		"npc/controller/con_idle2.wav",
		"npc/controller/con_idle3.wav",
		"npc/controller/con_idle4.wav",
		"npc/controller/con_idle5.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 150, 400, 400, 150
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/controller.mdl"),
			}
		}
	end
end

return ITEM
