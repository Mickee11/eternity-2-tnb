ITEM = class.Create("base_monster")

ITEM.Name 				= "Bullsquid"
ITEM.Description 		= "A less friendlier version of the Houndeye, no?"

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Voicelines 	= {
	["Growl"] = {
		"npc/bullsquid/bc_attackgrowl1.wav",
		"npc/bullsquid/bc_attackgrowl2.wav",
		"npc/bullsquid/bc_attackgrowl3.wav"
	},
	["Attack"] = {
		"npc/bullsquid/bc_attack1.wav",
		"npc/bullsquid/bc_attack2.wav",
		"npc/bullsquid/bc_attack3.wav"
	},
	["Death"] = {
		"npc/bullsquid/bc_die1.wav",
		"npc/bullsquid/bc_die2.wav",
		"npc/bullsquid/bc_die3.wav"
	},
	["Idle"] = {
		"npc/bullsquid/bc_idle1.wav",
		"npc/bullsquid/bc_idle2.wav",
		"npc/bullsquid/bc_idle3.wav",
		"npc/bullsquid/bc_idle4.wav",
		"npc/bullsquid/bc_idle5.wav"
	},
	["Pain"] = {
		"npc/bullsquid/bc_pain1.wav",
		"npc/bullsquid/bc_pain2.wav",
		"npc/bullsquid/bc_pain3.wav",
		"npc/bullsquid/bc_pain4.wav"
	}
}

ITEM.SelectedSkin = 0

local options = {
	[0] = {Name = "Bullsquid", Model = "models/half-life/bullsquid.mdl"},
	[1] = {Name = "Devilsquid", Model = "models/devilsquid.mdl"},
	[2] = {Name = "Frostsquid", Model = "models/frostsquid.mdl"},
	[3] = {Name = "Acidsquid", Model = "models/poisonsquid.mdl"},
}

function ITEM:GetName()
	return options[self.SelectedSkin].Name
end

function ITEM:GetOptions(ply)
	local tab = {}

	for k, v in SortedPairs(options) do
		table.insert(tab, {
			Name = "Set skin: " .. v.Name,
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
		return 60, 250, 250, 60
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = options[self.SelectedSkin].Model,
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/babygarg/gar_step1.wav" or "npc/babygarg/gar_step2.wav", 0
	end
end

return ITEM
