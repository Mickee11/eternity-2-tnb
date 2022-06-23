ITEM = class.Create("base_xenian")

ITEM.Name 				= "Panthereye"
ITEM.Description 		= "A big cat that comes in multiple colors."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Alert"] = {
		"npc/panthereye/p_alert1.wav",
		"npc/panthereye/p_alert2.wav",
		"npc/panthereye/p_alert3.wav"
	},
	["Death"] = {
		"npc/panthereye/p_die1.wav",
		"npc/panthereye/p_die2.wav"
	},
	["Idle"] = {
		"npc/panthereye/p_idle1.wav",
		"npc/panthereye/p_idle2.wav",
		"npc/panthereye/p_idle3.wav"
	},
	["Pain"] = {
		"npc/panthereye/p_pain1.wav",
		"npc/panthereye/p_pain2.wav"
	}
}

ITEM.SelectedSkin = 0

local options = {
	[0] = "Red",
	[1] = "Blue",
}

function ITEM:GetOptions(ply)
	local tab = {}

	for k, v in SortedPairs(options) do
		table.insert(tab, {
			Name = "Set color: " .. v,
			Callback = function()
				self.SelectedSkin = k

				ply:HandlePlayerModel()
			end
		})
	end

	for _, v in pairs(self:ParentCall("GetOptions", ply)) do
		table.insert(tab, v)
	end

	return tab
end

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 65, 250, 230, 65
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/panthereye.mdl"),
				Skin = self.SelectedSkin
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/chumtoad/toad_hunt2.wav" or "npc/chumtoad/toad_hunt3.wav", 0
	end
end

return ITEM
