ITEM = class.Create("base_monster")

ITEM.Name 				= "The Thing"
ITEM.Description 		= "What the fuck."

ITEM.Model 				= Model("models/weapons/w_bugbait.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Growl"] = {
		"aliens/voc/biomass/death.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 65, 250, 230, 65
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/fallout/centaur_thing.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "vj_fallout/streettrog/foot/trog_foot_l01.mp3"
	end
end

return ITEM
