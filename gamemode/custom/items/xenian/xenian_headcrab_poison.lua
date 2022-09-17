ITEM = class.Create("base_monster")

ITEM.Name 				= "Poison Headcrab"
ITEM.Description 		= "A toxic bugger, that's for sure."

ITEM.Model 				= Model("models/gibs/antlion_gib_small_2.mdl")

ITEM.Voicelines 	= {
	["Idle"] = {
		"npc/headcrab_poison/ph_idle1.wav",
		"npc/headcrab_poison/ph_idle2.wav",
		"npc/headcrab_poison/ph_idle3.wav"
	},
	["Rattle"] = {
		"npc/headcrab_poison/ph_rattle1.wav",
		"npc/headcrab_poison/ph_rattle2.wav",
		"npc/headcrab_poison/ph_rattle3.wav"
	},
	["Talk"] = {
		"npc/headcrab_poison/ph_talk1.wav",
		"npc/headcrab_poison/ph_talk2.wav",
		"npc/headcrab_poison/ph_talk3.wav"
	},
	["Warning"] = {
		"npc/headcrab_poison/ph_warning1.wav",
		"npc/headcrab_poison/ph_warning2.wav",
		"npc/headcrab_poison/ph_warning3.wav"
	},
	["Pain"] = {
		"npc/headcrab_poison/ph_pain1.wav",
		"npc/headcrab_poison/ph_pain2.wav",
		"npc/headcrab_poison/ph_pain3.wav"
	},
	["Scream"] = {
		"npc/headcrab_poison/ph_scream1.wav",
		"npc/headcrab_poison/ph_scream2.wav",
		"npc/headcrab_poison/ph_scream3.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 25, 110, 310, 25
	end

	function ITEM:GetModelData(ply)
		return {
			_base = {
				Model = Model("models/headcrabblack.mdl")
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		if walking then
			return "NPC_BlackHeadcrab.FootstepWalk"
		end

		return "NPC_BlackHeadcrab.Footstep"
	end
end

return ITEM
