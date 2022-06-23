ITEM = class.Create("base_xenian")

ITEM.Name 				= "Charger"
ITEM.Description 		= "A run, you die."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 120, 450, 225, 80
	end

	function ITEM:PostModelData(ply, data)
		local mdl = "models/charger/charger.mdl"

		return {
			_base = {
				Model = Model(mdl),
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "npc/voltigore/voltigore_footstep1.wav" or "npc/voltigore/voltigore_footstep2.wav", 0.1
		end

		return "npc/voltigore/voltigore_footstep1.wav", 0
	end
end

return ITEM
