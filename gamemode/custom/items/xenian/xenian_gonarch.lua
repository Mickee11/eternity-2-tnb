ITEM = class.Create("base_monster")

ITEM.Name 				= "Gonarch"
ITEM.Description 		= "The matriarch of the headcrab family, also known as the big momma."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/gonarch/gon_alert1.wav",
		"npc/gonarch/gon_alert2.wav",
		"npc/gonarch/gon_alert3.wav"
	},
	["Cry"] = {
		"npc/gonarch/gon_childdie1.wav",
		"npc/gonarch/gon_childdie2.wav",
		"npc/gonarch/gon_childdie3.wav"
	},
	["Die"] = "npc/gonarch/gon_die1.wav"
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 170, 500, 300, 170
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/big_mom.mdl"),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if step then
			return "npc/gonarch/gon_step" .. math.random(1, 3) .. ".wav", 0.5
		end

		return "npc/gonarch/gon_step1.wav", 0
	end
end

return ITEM
