ITEM = class.Create("base_monster")

ITEM.Name 				= "Infectious Fly"
ITEM.Description 		= "It stinks of sulfur, and its stinger drips a orangish liquid."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Angry"] = {
		"aliens/voc/drone/roar01.wav",
		"aliens/voc/drone/roar02.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/blowfly.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/blowfly/blowfly_idle_lp.wav"
	end
end

return ITEM