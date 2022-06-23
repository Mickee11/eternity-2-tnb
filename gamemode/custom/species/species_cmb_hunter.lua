local CLASS = class.Create("base_species")

CLASS.Name 					= "Combine Overwatch: HUNTER"
CLASS.Team 					= TEAM_OVERWATCH

CLASS.ForceTeamSpawn		= true

CLASS.BaseHealth 			= 2500

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/hunter.mdl")
}

CLASS.IgnoreHungerEffects	= true

CLASS.OverrideWorldArea		= true

CLASS.Voicelines 			= {
    ["Alert 1"] = "npc/ministrider/hunter_alert1.wav",
    ["Alert 2"] = "npc/ministrider/hunter_alert2.wav",
    ["Alert 3"] = "npc/ministrider/hunter_alert3.wav",
    ["Angry 1"] = "npc/ministrider/hunter_angry1.wav",
    ["Angry 2"] = "npc/ministrider/hunter_angry2.wav",
    ["Angry 3"] = "npc/ministrider/hunter_angry3.wav",
    ["Spotted 1"] = "npc/ministrider/hunter_foundenemy2.wav",
    ["Spotted 2"] = "npc/ministrider/hunter_foundenemy3.wav",
    ["Spotted 3"] = "npc/ministrider/hunter_charge3.wav",
    ["Spotted 4"] = "npc/ministrider/hunter_charge4.wav",
    ["Scan 1"] = "npc/ministrider/hunter_scan1.wav",
    ["Scan 2"] = "npc/ministrider/hunter_scan2.wav",
    ["Scan 3"] = "npc/ministrider/hunter_scan3.wav",
    ["Scan 4"] = "npc/ministrider/hunter_scan4.wav",
    ["Idle 1"] = "npc/ministrider/hunter_idle1.wav",
    ["Idle 2"] = "npc/ministrider/hunter_idle2.wav",
    ["Idle 3"] = "npc/ministrider/hunter_idle3.wav",
    ["Laugh 1"] = "npc/ministrider/hunter_laugh1.wav",
    ["Laugh 2"] = "npc/ministrider/hunter_laugh2.wav",
    ["Laugh 3"] = "npc/ministrider/hunter_laugh3.wav",
    ["Laugh 4"] = "npc/ministrider/hunter_laugh4.wav",
    ["Laugh 5"] = "npc/ministrider/hunter_laugh5.wav",
    ["Pain 1"] = "npc/ministrider/hunter_pain2.wav",
    ["Pain 2"] = "npc/ministrider/hunter_pain4.wav"
}

CLASS.DisabledProperties 	= {
	["RPName"] = true,
	["Description"] = true,
	["SecondLanguage"] = true,
}

CLASS.AllowStash 			= false
CLASS.NoFallDamage 			= true
CLASS.GasImmune 			= true

CLASS.ArmorLevel            = ARMOR_SUPER

CLASS.EquipmentSlots 		= {}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO}

CLASS.MoveSpeed 			= {
	Walk = 160,
	Run = 600,
	Jump = 700,
	Crouch = 160
}

CLASS.BlockNameChange		= true

CLASS.DeathSounds 			= {
    "npc/ministrider/hunter_die2.wav",
    "npc/ministrider/hunter_die3.wav"
}

CLASS.SpeciesDefaults		= {
	CombinePermissions = {
		[COMBINE_DOORS_NEXUS] = true,
		[COMBINE_DOORS_LOCKS] = true,
		[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
	},
	CombineLevel = COMBINE_LEVEL_UPPERASSET,
	VisibleRPName = function(ply, scoreboard) return string.format("COSA.S22-HUNTER.%s", ply:VisibleCitizenNumber()) end,
	ForceTeam = TEAM_OVERWATCH,
	DisallowTeamItems = true,
	UseTeamSpawn = true,
}

CLASS.SpeciesStates = { }

function CLASS:FootstepTime(ply, type, walking)

	if walking then
		if not ply:Crouching() then
			return 400	
		else
			return 350
		end
	else
		return 300
	end
end

if SERVER then
	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)

		ply:SetRPName("Combine Overwatch: HUNTER")
    end
    
	function CLASS:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "npc/ministrider/ministrider_footstep1.wav" or "npc/ministrider/ministrider_footstep2.wav", 0.2
        end
        
        return step and "npc/ministrider/ministrider_footstep1.wav" or "npc/ministrider/ministrider_footstep2.wav", 0.1
	end

	function CLASS:GetModelData(ply)
		local data = {
			_base = {
				Model = ply:CharModel(),
                Skin = 0,
                Scale = 1
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