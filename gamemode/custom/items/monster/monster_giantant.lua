ITEM = class.Create("base_monster")

ITEM.Name 				= "Giant Ant"
ITEM.Description 		= "Can't kill this with a magnifying glass."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Angry"] = {
		"aliens/voc/boomer/inflate_voc01.wav",
		"aliens/voc/boomer/inflate_voc02.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/giantant.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/giantant/foot/ant_foot_l01.mp3"
	end
end

return ITEM
