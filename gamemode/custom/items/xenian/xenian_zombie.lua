ITEM = class.Create("base_monster")

ITEM.Name 				= "Zombie"
ITEM.Description 		= "Rambling and grunting for all eternity."

ITEM.Model 				= Model("models/gibs/hgibs.mdl")

ITEM.ArmorLevel			= ARMOR_LIGHT

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/zombie/zombie_alert1.wav",
		"npc/zombie/zombie_alert2.wav",
		"npc/zombie/zombie_alert3.wav"
	}
}

ITEM.Torso = false

function ITEM:GetOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle Torso Only",
		Callback = function(val)
			self.Torso = not self.Torso

			ply:HandlePlayerModel()
		end
	})

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetSpeeds(ply)
		if self.Torso then
			return 31, 60, 210, 31
		end

		return 45, 90, 210, 45
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model(self.Torso and "models/Zombie/Classic_torso.mdl" or "models/Zombie/Classic.mdl"),
				Bodygroups = {
					headcrab1 = 1
				}
			}
		}
	end
end

return ITEM
