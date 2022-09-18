ITEM = class.Create("base_monster")

ITEM.Name 				= "Kingpin"
ITEM.Description 		= "At least it's not Mr. Friendly, no?"

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Breathe"] = {
		"npc/kingpin/kingpin_breath01.mp3",
		"npc/kingpin/kingpin_breath02.mp3"
	},
	["Death"] = {
		"npc/kingpin/kingpin_death01.mp3",
		"npc/kingpin/kingpin_death02.mp3"
	},
	["Injured"] = {"npc/kingpin/kingpin_injured01.mp3",
		"npc/kingpin/kingpin_injured02.mp3",
		"npc/kingpin/kingpin_injured03.mp3"
	},
	["Sneeze"] = "npc/kingpin/kingpin_sneeze.mp3",
	["Hunger"] = {
		"npc/kingpin/kingpin_stummyrumble01.mp3",
		"npc/kingpin/kingpin_stummyrumble02.mp3"
	},
	["Mind Link"] = "npc/kingpin/kingpin_mindlinkbegin.mp3",
	["Telekinesis"] = {
		"npc/kingpin/kingpin_telehold01.mp3",
		"npc/kingpin/kingpin_telehold02.mp3"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 35, 120, 130, 35
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/kingpin.mdl"),
			}
		}
	end
end

return ITEM
