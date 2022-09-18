ITEM = class.Create("base_monster")

ITEM.Name 				= "Chumtoad"
ITEM.Description 		= "Ribbet."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.Voicelines 	= {
	["Ribbit"] = "npc/chumtoad/toad_deploy1.wav",
	["Hunt"] = {
		"npc/chumtoad/toad_hunt1.wav",
		"npc/chumtoad/toad_hunt2.wav",
		"npc/chumtoad/toad_hunt3.wav"
	},
	["Idle"] = "npc/chumtoad/toad_idle1.wav",
	["Die"] = "npc/chumtoad/toad_die1.wav"
}

ITEM.SelectedSkin = 0

local options = {
	[0] = "Purple",
	[1] = "Blue",
	[2] = "Brown",
	[3] = "Green"
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
		return 55, 150, 275, 55
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/half-life/chumtoad.mdl"),
				Skin = self.SelectedSkin
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/chumtoad/toad_hunt2.wav" or "npc/chumtoad/toad_hunt3.wav"
	end
end

return ITEM
