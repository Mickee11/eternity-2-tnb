ITEM = class.Create("base_monster")

ITEM.Name 				= "Stinger"
ITEM.Description 		= "Sharp blade attached to their end."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Angry"] = {
		"vj_fallout/radscorpion/radscorpion_attackstingvox03.mp3",
		"vj_fallout/radscorpion/radscorpion_attacksting01.mp3"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 180, 470, 210, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/barkscorpion.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/radscorpion/radscorpion_claws01.mp3"
	end
end

return ITEM
