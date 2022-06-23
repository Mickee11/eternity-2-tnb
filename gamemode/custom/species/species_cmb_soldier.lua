local CLASS = class.Create("base_species")

CLASS.Name 					= "Combine Overwatch: SOLDIER"
CLASS.Team 					= TEAM_OVERWATCH

CLASS.InventorySize 		= {9, 8}

CLASS.ForceTeamSpawn		= true

CLASS.BaseHealth 			= 250

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/tnb/halflife2/combine/combine_elite_soldier_redone.mdl")
}

CLASS.IgnoreHungerEffects	= true

CLASS.Voicelines 			= {
	["Administer"] = "npc/combine_soldier/vo/administer.wav",
	["Affirmative"] = "npc/combine_soldier/vo/affirmative.wav",
	["Anti-Citizen One"] = "npc/combine_soldier/vo/anticitizenone.wav",
	["Body Pack Holding"] = "npc/combine_soldier/vo/bodypackholding.wav",
	["Bouncer, Bouncer!"] = "npc/combine_soldier/vo/bouncerbouncer.wav",
	["Unit Moving In"] = "npc/combine_soldier/vo/unitismovingin.wav",
	["Unit Inbound"] = "npc/combine_soldier/vo/unitisinbound.wav",
	["Unit Closing"] = "npc/combine_soldier/vo/unitisclosing.wav",
	["Target Blackout"] = "npc/combine_soldier/vo/targetblackout.wav",
	["Target Compromised"] = "npc/combine_soldier/vo/targetcompromisedmovein.wav",
	["Target Ineffective"] = "npc/combine_soldier/vo/targetineffective.wav",
	["Target My Radial"] = "npc/combine_soldier/vo/targetmyradial.wav",
	["Stay Alert"] = "npc/combine_soldier/vo/stayalert.wav",
	["Standing By"] = "npc/combine_soldier/vo/standingby].wav",
	["Sector Is Secure"] = "npc/combine_soldier/vo/sectorissecurenovison.wav",
	["Sector Is Not Secure"] = "npc/combine_soldier/vo/sectorisnotsecure.wav",
	["Ripcord"] = "npc/combine_soldier/vo/ripcord.wav",
	["Ripcord, Ripcord!"] = "npc/combine_soldier/vo/ripcordripcord.wav",
	["Request Medical"] = "npc/combine_soldier/vo/requestmedical.wav",
	["Reporting Clear"] = "npc/combine_soldier/vo/reportingclear.wav",
	["Prep For Contact"] = "npc/combine_soldier/vo/prepforcontact.wav",
	["Copy"] = "npc/combine_soldier/vo/copy.wav",
	["Copy That"] = "npc/combine_soldier/vo/copythat.wav",
	["Cover Me"] = "npc/combine_soldier/vo/coverme.wav",
	["Covering"] = "npc/combine_soldier/vo/cover.wav",
	["Fix Sightlines, Move In"] = "npc/combine_soldier/vo/fixsightlinesmovein.wav",
	["Harden That Position"] = "npc/combine_soldier/vo/hardenthatposition.wav",
	["Overwatch Advise, Heavy Resistance"] = "npc/combine_soldier/vo/heavyresistance.wav",
}

CLASS.DisabledProperties 	= {
	["RPName"] = true,
	["Description"] = true,
	["SecondLanguage"] = true,
}

CLASS.AllowStash 			= true

CLASS.EquipmentSlots 		= {EQUIPMENT_COMBINE}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO, EQUIPMENT_PRIMARY, EQUIPMENT_SECONDARY, EQUIPMENT_MELEE, EQUIPMENT_MISC}

CLASS.BlockNameChange		= true

CLASS.OverrideWorldArea		= true

CLASS.MoveSpeed 			= {
	Walk = 70,
	Run = 215,
	Jump = 210,
	Crouch = 70
}

CLASS.DeathSounds 			= {
	"npc/combine_soldier/die1.wav",
	"npc/combine_soldier/die2.wav",
	"npc/combine_soldier/die3.wav"
}

CLASS.SpeciesDefaults = {
	CombinePermissions = {
		[COMBINE_DOORS_NEXUS] = true,
		[COMBINE_DOORS_LOCKS] = true,
		[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
		[COMBINE_TECHNOLOGY_APC] = true,
		[COMBINE_SQUADHUD_JOINTEAM] = true,
		[COMBINE_SQUADHUD_CREATETEAM] = true,
		[COMBINE_SURVEILANCE_BASIC] = true,
		[COMBINE_RECORDS_READONLY] = true,
		[COMBINE_GEARBOX_COTA] = true
	},
	CombineLevel = COMBINE_LEVEL_UPPERASSET,
	VisibleRPName = function(ply, scoreboard)
		return string.format("COTA.%s-INF.%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
	end,
	ForceTeam = TEAM_OVERWATCH,
	DisallowTeamItems = true,
	UseTeamSpawn = true,
}

CLASS.SpeciesStates = {
	["soldier_generic"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.%s-INF.%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_corporal"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.%s-CPL.%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_ordinal"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.%s-ORD.%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_captain"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.%s-CPT.%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_norank"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.%s-%s", ply:CombineSquad(), ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_dvl"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.C107-DvL.%s", ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["soldier_drb"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.DRB-%s", ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["apf_generic"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_READONLY] = true,
			[COMBINE_GEARBOX_COTA] = true
		},
		CombineLevel = COMBINE_LEVEL_UPPERASSET,
		VisibleRPName = function(ply, scoreboard)
			return string.format("COTA.APF-%s", ply:VisibleCitizenNumber())
		end,
		ForceTeam = TEAM_OVERWATCH,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	}
}

function CLASS:FootstepTime(ply, type, walking)

	if walking then
		if not ply:Crouching() then
			return 550
		else
			return 450
		end
	else
		return 300
	end
end

if SERVER then
	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)

		ply:SetRPName("Combine Overwatch: SOLDIER")

		ply:SetSpeciesState("soldier_generic")
    end
    
	function CLASS:OverwriteFootsteps(ply, step, walking)
		if GAMEMODE:GetCloakVal(ply) > 0.3 then
			return nil, 0
		end

		if not walking then
			return step and "NPC_CombineS.RunFootstepLeft" or "NPC_CombineS.RunFootstepRight", 0.2
		end
	end

	function CLASS:GetModelData(ply)
		local data = {
			_base = {
				Model = ply:CharModel(),
				Bodygroups = {
					Head = 0,
					Bodyarmor = 0,
					Shoulderpads = 0,
					Handstraps = 0,
					Beltgear = 0,
					Legstraps = 0
				}
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
