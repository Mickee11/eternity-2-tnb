ITEM = class.Create("base_monster")

ITEM.Name 				= "Poison Zombie"
ITEM.Description 		= "Rambling and grunting for all eternity, but toxic and such."

ITEM.Model 				= Model("models/gibs/hgibs.mdl")

ITEM.ArmorLevel			= ARMOR_LIGHT

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/zombie_poison/pz_alert1.wav",
		"npc/zombie_poison/pz_alert2.wav"
	},
	["Call"] = "npc/zombie_poison/pz_call1.wav",
	["Idle"] = {
		"npc/zombie_poison/pz_idle2.wav",
		"npc/zombie_poison/pz_idle3.wav",
		"npc/zombie_poison/pz_idle4.wav"
	}
}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 55, 150, 210, 55
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/Zombie/Poison.mdl"),
				Bodygroups = {
					headcrab1 = 1,
					headcrab2 = 1,
					headcrab3 = 1,
					headcrab4 = 1
				}
			}
		}
	end
end

return ITEM
