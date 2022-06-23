ITEM = class.Create("base_xenian")

ITEM.Name 				= "Fast Zombie"
ITEM.Description 		= "Rambling and grunting for all eternity, but quickly and such."

ITEM.Model 				= Model("models/gibs/hgibs.mdl")

ITEM.ArmorLevel			= ARMOR_LIGHT

ITEM.Voicelines 	= {
	["Alert"] = "npc/fast_zombie/fz_alert_close1.wav",
	["Frenzy"] = "npc/fast_zombie/fz_frenzy1.wav",
	["Scream"] = "npc/fast_zombie/fz_scream1.wav",
	["Idle"] = {
		"npc/fast_zombie/idle1.wav",
		"npc/fast_zombie/idle2.wav",
		"npc/fast_zombie/idle3.wav"
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
			return 55, 90, 210, 55
		end

		return 55, 215, 600, 55
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model(self.Torso and "models/zombie/fast_torso.mdl" or "models/zombie/fast.mdl"),
				Bodygroups = {
					headcrab1 = 1
				}
			}
		}
	end
end

return ITEM
