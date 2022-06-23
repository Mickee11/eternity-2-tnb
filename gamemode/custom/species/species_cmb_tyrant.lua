local CLASS = class.Create("base_species")

CLASS.Name 					= "Combine Overwatch: TYRANT"
CLASS.Team 					= TEAM_OVERWATCH

CLASS.ForceTeamSpawn		= true

CLASS.BaseHealth 			= 5000

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/tnb/halflife2/combine/synth_soldier.mdl")
}

CLASS.IgnoreHungerEffects	= true

CLASS.OverrideWorldArea		= true

CLASS.Voicelines 			= {
    ["Alert 1"] = "tnb/halflife2/combine/tyrant_alert01.wav",
    ["Alert 2"] = "tnb/halflife2/combine/tyrant_alert02.wav",
    ["Alert 3"] = "tnb/halflife2/combine/tyrant_alert03.wav",
    ["Angry 1"] = "tnb/halflife2/combine/tyrant_angry01.wav",
    ["Distant 1"] = "tnb/halflife2/combine/tyrant_distant01.wav",
    ["Distant 2"] = "tnb/halflife2/combine/tyrant_distant02.wav",
    ["Idle 1"] = "tnb/halflife2/combine/tyrant_idle01.wav",
    ["Idle 2"] = "tnb/halflife2/combine/tyrant_idle02.wav",
    ["Idle 3"] = "tnb/halflife2/combine/tyrant_idle03.wav",
    ["Roar 1"] = "tnb/halflife2/combine/tyrant_roar01.wav",
    ["Roar 2"] = "tnb/halflife2/combine/tyrant_roar02.wav",
}

CLASS.DisabledProperties 	= {
	["RPName"] = true,
	["Description"] = true,
	["SecondLanguage"] = true,
}

CLASS.AllowStash 			= false
CLASS.NoFallDamage 			= true
CLASS.GasImmune 			= true

CLASS.ArmorLevel            = ARMOR_ELITE

CLASS.EquipmentSlots 		= {EQUIPMENT_COMBINE}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO, EQUIPMENT_PRIMARY, EQUIPMENT_SECONDARY, EQUIPMENT_MELEE, EQUIPMENT_MISC}

CLASS.MoveSpeed 			= {
	Walk = 80,
	Run = 240,
	Jump = 220,
	Crouch = 80
}

CLASS.BlockNameChange		= true

CLASS.DeathSounds 			= {
	"tnb/halflife2/combine/tyrant_die01.wav"
}

CLASS.SpeciesDefaults		= {
	CombinePermissions = {
		[COMBINE_DOORS_NEXUS] = true,
		[COMBINE_DOORS_LOCKS] = true,
		[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
		[COMBINE_TECHNOLOGY_APC] = true,
		[COMBINE_SQUADHUD_JOINTEAM] = true,
		[COMBINE_SQUADHUD_CREATETEAM] = true,
		[COMBINE_SURVEILANCE_BASIC] = true,
		[COMBINE_RECORDS_READONLY] = true,
		[COMBINE_ADMINS_DISPATCH] = true,
		[COMBINE_ADMINS_WAIVER]	= true,
	},
	CombineLevel = COMBINE_LEVEL_UPPERASSET,
	VisibleRPName = function(ply, scoreboard) return string.format("COSA.S22-TYRANT.%s", ply:VisibleCitizenNumber()) end,
	ForceTeam = TEAM_OVERWATCH,
	DisallowTeamItems = true,
	UseTeamSpawn = true,
}

CLASS.SpeciesStates = { }

function CLASS:FootstepTime(ply, type, walking)

	if walking then
		if not ply:Crouching() then
			return 650
		else
			return 400
		end
	else
		return 175
	end
end

if SERVER then
	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)

		ply:SetRPName("Combine Overwatch: TYRANT")
    end
    
	function CLASS:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "tnb/halflife2/combine/tyrant_step01.wav" or "tnb/halflife2/combine/tyrant_step02.wav", 0.2
        end
        
        return step and "tnb/halflife2/combine/tyrant_step01.wav" or "tnb/halflife2/combine/tyrant_step02.wav", 0.1
	end

	function CLASS:GetModelData(ply)
		local data = {
			_base = {
				Model = ply:CharModel(),
                Skin = 0,
                Scale = 1.3
			}
		}

		return data
    end
    
	function CLASS:SetupHands(ply, ent)
		local mdl = "models/weapons/c_arms_combine.mdl"

		ent:SetModel(mdl)
		ent:SetSkin(0)
		ent:SetBodyGroups("00000000")
	end
end

return CLASS