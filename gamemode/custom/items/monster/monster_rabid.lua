ITEM = class.Create("base_monster")

ITEM.Name 				= "Rabid Monster"
ITEM.Description 		= "Drooling and ready for action. Might have rabies."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Angry"] = {
		"npc/antlion_guard/angry1.wav",
		"npc/antlion_guard/angry2.wav",
		"npc/antlion_guard/angry3.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/deathclaw_baby.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/deathclaw/foot/deathclaw_foot_l01.mp3"
	end
end

return ITEM
