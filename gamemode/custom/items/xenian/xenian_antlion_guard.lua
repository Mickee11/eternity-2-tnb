ITEM = class.Create("base_monster")

ITEM.Name 				= "Antlion Guard"
ITEM.Description 		= "A big one, that's for sure."

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
				Model = Model("models/antlion_guard.mdl"),
				Skin = 0
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "NPC_AntlionGuard.StepHeavy"
	end
end

return ITEM
