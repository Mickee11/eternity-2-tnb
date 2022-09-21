ITEM = class.Create("base_monster")

ITEM.Name 				= "The Queen"
ITEM.Description 		= "Long live the Queen."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Groan"] = {
		"aliens/voc/ranger/prefire01.wav",
		"aliens/voc/ranger/prefire02.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/giantantqueen.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/giantantqueen/foot/antqueen_foot_l01.mp3"
	end
end

return ITEM