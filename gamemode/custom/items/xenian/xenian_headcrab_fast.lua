ITEM = class.Create("base_xenian")

ITEM.Name 				= "Fast Headcrab"
ITEM.Description 		= "A fast little bugger."

ITEM.Model 				= Model("models/gibs/antlion_gib_small_2.mdl")

ITEM.Voicelines 	= {
	["Alert"] = "npc/headcrab_fast/alert1.wav",
	["Idle"] = "npc/headcrab_fast/idle3.wav"
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 90, 190, 310, 90
	end

	function ITEM:GetModelData(ply)
		return {
			_base = {
				Model = Model("models/headcrab.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "NPC_FastHeadcrab.Footstep"
	end
end

return ITEM
