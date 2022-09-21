ITEM = class.Create("base_monster")

ITEM.Name 				= "Praying Mantis"
ITEM.Description 		= "It grew just a bit."

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
				Model = Model("models/fallout/mantis.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/mantis/foot/fst_mantis_r01.mp3"
	end
end

return ITEM