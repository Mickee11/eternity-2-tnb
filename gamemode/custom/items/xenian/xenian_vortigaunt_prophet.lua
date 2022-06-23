ITEM = class.Create("base_xenian")

ITEM.Name 				= "Vortigaunt Prophet"
ITEM.Description 		= "Something about Post-HL2 and split timelines."

ITEM.Model 				= Model("models/stukabat_acid.mdl")

ITEM.ArmorLevel			= ARMOR_ELITE

ITEM.Voicelines 	= {
	["Alert"] = "npc/tor/tor-alerted.wav",
	["Attack"] = {
		"npc/tor/tor-attack1.wav",
		"npc/tor/tor-attack2.wav"
	},
	["Die"] = {
		"npc/tor/tor-die1.wav",
		"npc/tor/tor-die2.wav"
	},
	["Idle"] = {
		"npc/tor/tor-idle1.wav",
		"npc/tor/tor-idle2.wav",
		"npc/tor/tor-idle3.wav"
	},
	["Summon"] = "npc/tor/tor-summon.wav",
	["Dispell"] = "npc/tor/tor_dispell.wav"
}

ITEM.SelectedSkin = 0

function ITEM:GetOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Select Armor Skin",
		Client = function()
			return GAMEMODE:OpenGUI("Input", "number", "Select Armor Skin (0, 10)", {
				Default = self.SelectedSkin or 0
			})
		end,
		Callback = function(val)
			if not GAMEMODE:CheckInput("number", {}, val) then
				return
			end

			self.SelectedSkin = math.Clamp(val, 0, 10)

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
		return 90, 290, 200, 90
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/tor.mdl"),
				Skin = self.Skin
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return step and "npc/tor/tor_foot3.wav" or "npc/tor/tor_foot4.wav", 0.2
	end
end

return ITEM
