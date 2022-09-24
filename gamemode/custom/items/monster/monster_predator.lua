ITEM = class.Create("base_monster")

ITEM.Name 				= "Predator"
ITEM.Description 		= "Hunt them down."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Angry"] = {
		"vj_fallout/yaoguai/yaoguai_idlebreathe01.mp3",
		"vj_fallout/yaoguai/yaoguai_idlebreathe02.mp3",
		"vj_fallout/yaoguai/yaoguai_idlebreathe03.mp3",
		"vj_fallout/yaoguai/yaoguai_idlebreathe04.mp3",
		"vj_fallout/yaoguai/yaoguai_idlebreathe05.mp3"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/yaoguai.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/yaoguai/foot/yaoguai_footfront_l.mp3"
	end
end

return ITEM
