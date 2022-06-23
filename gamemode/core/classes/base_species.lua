local CLASS = class.Create()

CLASS.ID 					= -1

CLASS.Name 					= ""
CLASS.Team 					= TEAM_UNASSIGNED -- Scoreboard team

CLASS.ForceTeamSpawn 		= false -- If set to true, prevents this species from setting their spawnpoint

CLASS.BaseHealth 			= 100

CLASS.WeaponLoadout 		= {}
CLASS.PlayerModels 			= {} -- Only used for character creation

CLASS.DisabledProperties 	= {} -- Supported: RPName, Description. If #CLASS.PlayerModels <= 1 and no other properties are available, character creation will be skipped

CLASS.InventorySize 		= {9, 8}
CLASS.AllowStash 			= false -- Allows species to use a stash
CLASS.NoFallDamage 			= false
CLASS.GasImmune 			= false -- Immune to ent_zone_gas

CLASS.EquipmentSlots 		= {} -- Used with EQUIPMENT_ slots, positioned on the right side in the character's inventory
CLASS.WeaponSlots 			= {} -- Ditto but for the left side

CLASS.ArmorLevel 			= ARMOR_NONE -- Built-in armor, stacks with equipment

CLASS.UnderstandLanguages   = false -- Override all language checks?

CLASS.CustomMove			= false

CLASS.OverrideWorldArea		= false

CLASS.SpeciesDefaults		= {
	CombinePermissions = {},
	CombineLevel = COMBINE_LEVEL_CITIZEN,
	VisibleRPName = nil,
	ForceTeam = nil,
	DisallowTeamItems = nil,
	UseTeamSpawn = false,
}

CLASS.SpeciesStates			= {
	["default"] = {
		CombinePermissions = {},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		VisibleRPName = nil,
		ForceTeam = nil,
		DisallowTeamItems = nil,
		UseTeamSpawn = false,
	},
	["flaggeddefault"] = {
		CombinePermissions = {},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		VisibleRPName = nil,
		ForceTeam = nil,
		DisallowTeamItems = nil,
		UseTeamSpawn = false,
		Flagged = {
			CombinePermissions = {},
			CombineLevel = COMBINE_LEVEL_CITIZEN,
			VisibleRPName = nil,
			ForceTeam = nil,
			DisallowTeamItems = nil,
			UseTeamSpawn = true,
			AnnounceFlagging = true,
			FlaggingZone = "ent_zone_flagging"
		}
	}
} -- For admin command purposes.

CLASS.BlockNameChange		= false

CLASS.SpawnOffset			= nil

CLASS.MoveSpeed 			= {
	Walk = 80,
	Run = 220,
	Jump = 210,
	Crouch = 80
}

CLASS.DeathSounds 			= {} -- See CLASS:HandleDeathSounds()
CLASS.Voicelines 			= {} -- See CLASS:GetVoicelines()
CLASS.Gestures				= {}

function CLASS:Loadout(ply)
	for _, v in pairs(self.WeaponLoadout) do
		ply:Give(v)
	end
end

function CLASS:GetVoicelines(ply)
	return self.Voicelines
end

function CLASS:GetGestures(ply)
	return self.Gestures
end

function CLASS:OnStateChanged(ply, state)
end

function CLASS:FootstepTime(ply, type, walking)
end

if CLIENT then
	function CLASS:ProcessPreview(ent, pnl) -- Used to set up the character creation preview
	end

	function CLASS:PreDrawHUD()
	end
else
	function CLASS:OnSpawn(ply)
	end
	
	function CLASS:OnDeath(ply)
		self:HandleDeathSounds(ply)
	end

	function CLASS:Move(ply, move)
	end

	function CLASS:OverwriteFootsteps(ply, step, walking) -- Used to overwrite footstep sounds
	end

	function CLASS:HandleDeathSounds(ply)
		if #self.DeathSounds > 0 then
			local snd = table.Random(self.DeathSounds)

			ply:EmitSound(snd, 75, 100, 0.5)
		end
	end

	function CLASS:InitialSetup(ply) -- Called once when the character is loaded for the first time, ever
		ply:SetSpeciesState("default")
	end

	function CLASS:GetModelData(ply)
		return {
			_base = {
				Model = ply:CharModel(),
				Skin = ply:CharSkin()
			}
		}
	end

	function CLASS:SetupHands(ply, ent)
		ent:SetModel("models/weapons/c_arms_citizen.mdl")
		ent:SetSkin(0)
		ent:SetBodyGroups("00000000")
	end

	function CLASS:GetSpeeds(ply)
		return self.MoveSpeed.Walk, self.MoveSpeed.Run, self.MoveSpeed.Jump, self.MoveSpeed.Crouch
	end
end

class.Register("base_species", CLASS)