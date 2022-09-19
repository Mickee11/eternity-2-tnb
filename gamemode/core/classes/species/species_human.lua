local CLASS = class.Create("base_species")

CLASS.Name 					= "Human"
CLASS.Team 					= TEAM_CITIZENS

CLASS.InventorySize 		= {9, 8}

CLASS.BaseHealth 			= 100

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/tnb/heads/trp/male_01.mdl"),
	Model("models/tnb/heads/trp/male_02.mdl"),
	Model("models/tnb/heads/trp/male_03.mdl"),
	Model("models/tnb/heads/trp/male_04.mdl"),
	Model("models/tnb/heads/trp/male_05.mdl"),
	Model("models/tnb/heads/trp/male_06.mdl"),
	Model("models/tnb/heads/trp/male_07.mdl"),
	Model("models/tnb/heads/trp/male_08.mdl"),
	Model("models/tnb/heads/trp/male_09.mdl"),
	Model("models/tnb/heads/trp/female_01.mdl"),
	Model("models/tnb/heads/trp/female_02.mdl"),
	Model("models/tnb/heads/trp/female_03.mdl"),
	Model("models/tnb/heads/trp/female_04.mdl"),
	Model("models/tnb/heads/trp/female_05.mdl"),
	Model("models/tnb/heads/trp/female_38.mdl"),
	Model("models/tnb/heads/trp/female_53.mdl")
}

CLASS.SpeciesStates = {
	["citizen"] = {
		ForceTeam = TEAM_CITIZENS,
		DisallowTeamItems = true,
		CombinePermissions = {[COMBINE_RATION_STANDARD] = true},
		CombineLevel = COMBINE_LEVEL_CITIZEN
	},
	["freeform"] = {
		ForceTeam = TEAM_CITIZENS,
		DisallowTeamItems = true,
		CombinePermissions = {[COMBINE_RATION_STANDARD] = true},
		CombineLevel = COMBINE_LEVEL_CITIZEN
	},
	["citizen_outer"] = {
		ForceTeam = TEAM_OUTERRES,
		DisallowTeamItems = true,
		CombinePermissions = { },
		CombineLevel = COMBINE_LEVEL_CITIZEN
	},
	["infcon_intern"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_STANDARD] = true
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_RATION_STANDARD] = true
			},
			FlaggingZone = "ent_zone_infconstaging",
			VisibleRPName = function(ply, scoreboard) return string.format("CIC.C107-INTERN.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_INFCON,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["infcon_normal"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_RATION_ELEVATED] = true
			},
			FlaggingZone = "ent_zone_infconstaging",
			VisibleRPName = function(ply, scoreboard) return string.format("CIC.C107-%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_INFCON,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["infcon_teamleader"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_RATION_ELEVATED] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			},
			FlaggingZone = "ent_zone_infconstaging",
			VisibleRPName = function(ply, scoreboard) return string.format("CIC.C107-TL.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_INFCON,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["infcon_supervisor"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_RECORDS_READONLY] = true
			},
			FlaggingZone = "ent_zone_infconstaging",
			VisibleRPName = function(ply, scoreboard) return string.format("CIC.C107-SVR.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_INFCON,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["engineer_normal"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_RATION_ELEVATED] = true,
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
			},
			FlaggingZone = "ent_zone_cecwarehouse",
			VisibleRPName = function(ply, scoreboard) return string.format("CEC.C107-%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_ENGINEERS,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["engineer_foreman"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_RATION_ELEVATED] = true,
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_RECORDS_READONLY] = true,
			},
			FlaggingZone = "ent_zone_cecwarehouse",
			VisibleRPName = function(ply, scoreboard) return string.format("CEC.C107-CF.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_ENGINEERS,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["engineer_seniorforeman"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_RATION_HIGHQUALITY] = true,
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_RECORDS_READONLY] = true
			},
			FlaggingZone = "ent_zone_cecwarehouse",
			VisibleRPName = function(ply, scoreboard) return string.format("CEC.C107-SCF.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_ENGINEERS,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["engineer_chiefengineer"] = {
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		Flagged = {
			CombinePermissions = {
				[COMBINE_RATION_HIGHQUALITY] = true,
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_GEARBOX_LOWRISK] = true,
				[COMBINE_RECORDS_READONLY] = true
			},
			FlaggingZone = "ent_zone_cecwarehouse",
			VisibleRPName = function(ply, scoreboard) return string.format("CEC.C107-ChE.%s", ply:CombineSquad()) end,
			ForceTeam = TEAM_ENGINEERS,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
		}
	},
	["laboradmin"] = { 
		ForceTeam = TEAM_LABORADMIN,
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_WRITEABLE] = true,
			[COMBINE_MESSAGE_BROADCAST] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
			[COMBINE_GEARBOX_LOWRISK] = true,
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["combineadmin"] = { 
		ForceTeam = TEAM_COMBINEADMIN,
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_WRITEABLE] = true,
			[COMBINE_ADMINS_DISPATCH] = true,
			[COMBINE_ADMINS_WAIVER] = true,
			[COMBINE_GEARBOX_LOWRISK] = true,
			[COMBINE_MESSAGE_BROADCAST] = true,
			[COMBINE_MESSAGE_RADIO] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_UPPERADMIN,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["scientist_normal"] = { 
		ForceTeam = TEAM_SCIENTIST,
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["scientist_leader"] = { 
		ForceTeam = TEAM_SCIENTIST,
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_RECORDS_WRITEABLE] = true,
			[COMBINE_ADMINS_DISPATCH] = true,
			[COMBINE_ADMINS_WAIVER] = true,
			[COMBINE_GEARBOX_LOWRISK] = true,
			[COMBINE_MESSAGE_BROADCAST] = true,
			[COMBINE_MESSAGE_RADIO] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_UPPERADMIN,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
	},
	["police_recruit"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_RECORDS_READONLY] = true,
				[COMBINE_GEARBOX_LOWRISK] = true,
				[COMBINE_RATION_ELEVATED] = true,
			},
			CombineLevel = COMBINE_LEVEL_LOWERASSET,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-Rct.%s", ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_unit"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_ELEVATED] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_GEARBOX_POLICE] = true,
				[COMBINE_RATION_ELEVATED] = true,
			},
			CombineLevel = COMBINE_LEVEL_LOWERASSET,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-%s.%02i.%s", ply:CombineSquad(), ply:CombineRank(), ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_eliteunit"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_ELEVATED] = true,
			},
			CombineLevel = COMBINE_LEVEL_LOWERASSET,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-%s.EU.%s", ply:CombineSquad(), ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_intel"] = {
		ForceTeam = TEAM_INSPECTORS,
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
			[COMBINE_TECHNOLOGY_APC] = true,
			[COMBINE_TECHNOLOGY_LOCK] = true,
			[COMBINE_SQUADHUD_CREATETEAM] = true,
			[COMBINE_SQUADHUD_JOINTEAM] = true,
			[COMBINE_SURVEILANCE_BASIC] = true,
			[COMBINE_SURVEILANCE_UNITS] = true,
			[COMBINE_ADMINS_DISPATCH] = true,
			[COMBINE_ADMINS_WAIVER] = true,
			[COMBINE_RECORDS_WRITEABLE] = true,
			[COMBINE_GEARBOX_INTELLIGENCE] = true,
			[COMBINE_MESSAGE_BROADCAST] = true,
			[COMBINE_MESSAGE_DISPATCH] = true,
			[COMBINE_MESSAGE_RADIO] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_LOWERADMIN,
		DisallowTeamItems = true,
		UseTeamSpawn = true,
		Flagged = {
			CombineLevel = COMBINE_LEVEL_LOWERADMIN,
			FlaggingZone = "ent_zone_combinenexus",
			VisibleRPName = function(ply, scoreboard) 
				return string.format("CCA.C107-CLOAK.%s", ply:VisibleCitizenNumber())
			end,	
		}
	},
	["police_adjutant"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_ADMINS_DISPATCH] = true,
				[COMBINE_ADMINS_WAIVER] = true,
				[COMBINE_ADMINS_PROMOTE] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
			},
			CombineLevel = COMBINE_LEVEL_LOWERADMIN,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-%s.AdJ.%s", ply:CombineSquad(), ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_squadleader"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_ADMINS_DISPATCH] = true,
				[COMBINE_ADMINS_WAIVER] = true,
				[COMBINE_ADMINS_PROMOTE] = true,
				[COMBINE_ADMINS_PROMOTE_SQL] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
			},
			CombineLevel = COMBINE_LEVEL_LOWERADMIN,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-%s.SqL.%s", ply:CombineSquad(), ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_captain"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_ADMINS_DISPATCH] = true,
				[COMBINE_ADMINS_WAIVER] = true,
				[COMBINE_ADMINS_PROMOTE] = true,
				[COMBINE_ADMINS_PROMOTE_SQL] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_BROADCAST] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
			},
			CombineLevel = COMBINE_LEVEL_UPPERADMIN,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-CmD.%s", ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_commissioner"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_ADMINS_DISPATCH] = true,
				[COMBINE_ADMINS_WAIVER] = true,
				[COMBINE_ADMINS_PROMOTE] = true,
				[COMBINE_ADMINS_PROMOTE_SQL] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_BROADCAST] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
			},
			CombineLevel = COMBINE_LEVEL_UPPERADMIN,
			VisibleRPName = function(ply, scoreboard) return string.format("CCA.C107-DvL.%s", ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	},
	["police_sector"] = { 
		CombinePermissions = {
			[COMBINE_DOORS_NEXUS] = true,
			[COMBINE_DOORS_LOCKS] = true,
			[COMBINE_RATION_HIGHQUALITY] = true,
		},
		CombineLevel = COMBINE_LEVEL_CITIZEN,
		Flagged = {
			FlaggingZone = "ent_zone_combinenexus",
			CombinePermissions = {
				[COMBINE_DOORS_NEXUS] = true,
				[COMBINE_DOORS_LOCKS] = true,
				[COMBINE_TECHNOLOGY_FORCEFIELD] = true,
				[COMBINE_TECHNOLOGY_APC] = true,
				[COMBINE_TECHNOLOGY_LOCK] = true,
				[COMBINE_SQUADHUD_JOINTEAM] = true,
				[COMBINE_SQUADHUD_CREATETEAM] = true,
				[COMBINE_SURVEILANCE_BASIC] = true,
				[COMBINE_SURVEILANCE_UNITS] = true,
				[COMBINE_RECORDS_WRITEABLE] = true,
				[COMBINE_ADMINS_DISPATCH] = true,
				[COMBINE_ADMINS_WAIVER] = true,
				[COMBINE_ADMINS_PROMOTE] = true,
				[COMBINE_ADMINS_PROMOTE_SQL] = true,
				[COMBINE_GEARBOX_COMMAND] = true,
				[COMBINE_MESSAGE_BROADCAST] = true,
				[COMBINE_MESSAGE_DISPATCH] = true,
				[COMBINE_MESSAGE_RADIO] = true,
				[COMBINE_RATION_HIGHQUALITY] = true,
			},
			CombineLevel = COMBINE_LEVEL_UPPERADMIN,
			VisibleRPName = function(ply, scoreboard) return string.format("UU.NA-SeC.%s", ply:VisibleCitizenNumber()) end,
			ForceTeam = TEAM_POLICE,
			DisallowTeamItems = true,
			UseTeamSpawn = true,
			AnnounceFlagging = true
		}
	}
}

CLASS.AllowStash 			= true

CLASS.EquipmentSlots 		= {EQUIPMENT_HEAD, EQUIPMENT_EYES, EQUIPMENT_TORSO, EQUIPMENT_BACK, EQUIPMENT_LEGS, EQUIPMENT_GLOVES}
CLASS.EquipmentSlots2		= {EQUIPMENT_MASK, EQUIPMENT_SCARF}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO, EQUIPMENT_PRIMARY, EQUIPMENT_SECONDARY, EQUIPMENT_MELEE, EQUIPMENT_MISC}

CLASS.Gestures				= {
	["Thumbs Up"] = "gesture_agree",
	["Forward"] = "gesture_signal_forward",
	["Group"] = "gesture_signal_group",
	["Halt"] = "gesture_signal_halt",
	["Wave"] = "gesture_wave",
	["Beckon"] = "gesture_becon",
}

CLASS.DeathSounds 			= {
	[GENDER_MALE] = {
		"vo/npc/male01/pain01.wav",
		"vo/npc/male01/pain02.wav",
		"vo/npc/male01/pain03.wav",
		"vo/npc/male01/pain04.wav",
		"vo/npc/male01/pain05.wav",
		"vo/npc/male01/pain06.wav",
		"vo/npc/male01/pain07.wav",
		"vo/npc/male01/pain08.wav",
		"vo/npc/male01/pain09.wav"
	},
	[GENDER_FEMALE] = {
		"vo/npc/female01/pain01.wav",
		"vo/npc/female01/pain02.wav",
		"vo/npc/female01/pain03.wav",
		"vo/npc/female01/pain04.wav",
		"vo/npc/female01/pain05.wav",
		"vo/npc/female01/pain06.wav",
		"vo/npc/female01/pain07.wav",
		"vo/npc/female01/pain08.wav",
		"vo/npc/female01/pain09.wav"
	}
}

CLASS.PoliceDeathSounds 	= {
	"npc/metropolice/die1.wav",
	"npc/metropolice/die2.wav",
	"npc/metropolice/die3.wav",
	"npc/metropolice/die4.wav"
}
 
CLASS.Voicelines = {
	["You Want A Malcompliance Verdict"] = "npc/metropolice/vo/youwantamalcomplianceverdict.wav",
	["We Have A 10-108"] = "npc/metropolice/vo/wehavea10-108.wav",
	["We Got A DB Here, Cancel That 11-42"] = "npc/metropolice/vo/wegotadbherecancel10-102.wav",
	["Watch It!"] = "npc/metropolice/vo/watchit.wav",
	["Vacate, Citizen"] = "npc/metropolice/vo/vacatecitizen.wav",
	["603 Unlawful Entry"] = "npc/metropolice/vo/unlawfulentry603.wav",
	["Unit Is 10-65"] = "npc/metropolice/vo/unitis10-65.wav",
	["This Is Your Second Warning"] = "npc/metropolice/vo/thisisyoursecondwarning.wav",
	["That's A Grenade!"] = "npc/metropolice/vo/thatsagrenade.wav",
	["Take Cover!"] = "npc/metropolice/vo/takecover.wav",
	["Tag 10-91D"] = "npc/metropolice/vo/tag10-91d.wav",
	["Sweeping For Suspect"] = "npc/metropolice/vo/sweepingforsuspect.wav",
	["Subject Is 505"] = "npc/metropolice/vo/subjectis505.wav",
	["Sentence Delivered"] = "npc/metropolice/vo/sentencedelivered.wav",
	["Responding"] = "npc/metropolice/vo/responding2.wav",
	["Proceed To Designated Checkpoints"] = "npc/metropolice/vo/proceedtocheckpoints.wav",
	["Possible 404 Here"] = "npc/metropolice/vo/possible404here.wav",
	["Possible 647E Here, Request Airwatch"] = "npc/metropolice/vo/possible647erequestairwatch.wav",
	["Possible Level 3 Civil Privacy Violator Here"] = "npc/metropolice/vo/possiblelevel3civilprivacyviolator.wav",
	["Officer Down, 10-99"] = "npc/metropolice/vo/officerdowniam10-99.wav",
	["Officer Down, Request Reinforcements"] = "npc/metropolice/vo/officerdowncode3tomy10-20.wav",
	["Officer Needs Help, 11-99"] = "npc/metropolice/vo/officerneedsassistance.wav",
	["Officer Needs Help, 11-99 (alternate)"] = "npc/metropolice/vo/11-99officerneedsassistance.wav",
	["Need Any Help With This One?"] = "npc/metropolice/vo/needanyhelpwiththisone.wav",
	["Moving To Hardpoint"] = "npc/metropolice/vo/movingtohardpoint.wav",
	["Moving To Cover"] = "npc/metropolice/vo/movingtocover.wav",
	["Move Along"] = "npc/metropolice/vo/movealong.wav",
	["Move Back, Right Now"] = "npc/metropolice/vo/movebackrightnow.wav",
	["Lookout!"] = "npc/metropolice/vo/lookout.wav",
	["Hold It"] = "npc/metropolice/vo/holdit.wav",
	["Hold It, Right There"] = "npc/metropolice/vo/holditrightthere.wav",
	["Get Out Of Here"] = "npc/metropolice/vo/getoutofhere.wav",
	["Copy"] = "npc/combine_soldier/vo/copy.wav",
	["Copy That"] = "npc/combine_soldier/vo/copythat.wav",
	["Chuckle"] = "npc/metropolice/vo/chuckle.wav",
	["It's Locked"] = "npc/metropolice/hiding04.wav",
	["Isolate"] = "npc/metropolice/hiding05.wav"
}

function CLASS:GetVoicelines(ply)
	local mdl = ply:ModelData()

	if mdl.head and mdl.head.Model and string.find(mdl.head.Model, "head_metropolice") then
		return self.Voicelines
	end

	return {}
end

if CLIENT then
	function CLASS:ProcessPreview(ent, pnl)
		part.Clear(ent)

		local gender = GAMEMODE:GetGenderString(ent:GetModel())

		part.Add(ent, "torso", {Model = string.format("models/tnb/halflife/%s_torso_citizen.mdl", gender)})
		part.Add(ent, "legs", {Model = string.format("models/tnb/halflife/%s_legs_jeans.mdl", gender)})

		ent:SetBodygroup(2, 1)
		ent:SetNoDraw(true)

		pnl.PreDrawModel = function()
			ent:DrawModel()

			local parts = part.Get(ent)

			if parts then
				for _, v in pairs(parts) do
					if IsValid(v.Ent) then
						v.Ent:DrawModel()
					end
				end
			end

			return false
		end
	end
else
	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)

		local credits = 250

		local package = ply:TopDonatorPackage()

		if package and DONATORPACKAGES[package].Credits then
			credits = credits + DONATORPACKAGES[package].Credits
		end

		ply:GiveMoney(credits)

		if package == DONATORPACKAGE_GOLD then
			local donatorpack = GAMEMODE:CreateItem("clothing_backpack_donator")

			ply:GetInventory(EQUIPMENT_BACK):AddItem(donatorpack, 1, 1)
			ply:HandlePlayerModel()
		end

		ply:SetSpeciesState("citizen")
	end

	function CLASS:SetupHands(ply, ent)
		local clothing = ply:GetEquipment(EQUIPMENT_TORSO)

		if clothing then
			local stop = clothing:SetupHands(ply, ent)

			if stop then
				return
			end
		end

		ent:SetModel("models/weapons/c_arms_citizen.mdl")
		ent:SetSkin(GAMEMODE:GetModelSkinTone(ply:CharModel()))

		local hands = ply:GetEquipment(EQUIPMENT_GLOVES)

		if hands then -- Player is wearing gloves.
			ent:SetBodyGroups("11111111")

			return
		end

		ent:SetBodyGroups("00000000")
	end

	function CLASS:OnStateChanged(ply, old, new)
		if #new == 0 then
			return -- Ignore first time context creation.
		end

		if not self.SpeciesStates[new] then
			return
		end

		if not self.SpeciesStates[new].Flagged and ply:IsFlagged() then
			ply:SetIsFlagged(false)

			ply:HandleFlagChange(false)
		end

        ply:HandleTeam()
	end
	
	function CLASS:OnDeath(ply)
		if ply:Team() == TEAM_POLICE and string.StartWith(ply:SpeciesState(), "police_") then
			GAMEMODE:SendDispatchMessage(string.format("Lost biosignal for protection team unit: %s. Remaining units contain.", ply:VisibleCitizenNumber()), {RADIOGROUP_CCA})
		end

		self:HandleDeathSounds(ply)
	end

	function CLASS:HandleDeathSounds(ply)
		local mdl = ply:ModelData()

		if ply:Team() == TEAM_POLICE or ply:Team() == TEAM_INSPECTORS then
			if ply:Team() == TEAM_POLICE and string.StartWith(ply:SpeciesState(), "police_") then
				local config = GAMEMODE:GetConfig("ChatRanges")
				local targets = GAMEMODE:GetRadioTargets(nil, frequency or 1000, nil, config.Speak, config.Whisper, false)
	
				netstream.Send("player.EmitLostBiosignalSound", {
					Player = ply
				}, targets)
			end

			if mdl.head and mdl.head.Model and string.find(mdl.head.Model, "head_metropolice") then
				local snd = table.Random(self.PoliceDeathSounds)
				
				ply:EmitSound(snd, 75, 100, 0.5)

				return
			end
		end

		local tab = self.DeathSounds[ply:Gender()]

		if tab and #tab > 0 then
			local snd = table.Random(tab)

			ply:EmitSound(snd, 75, 100, 0.5)
		end
	end

	function CLASS:GetModelData(ply)
		if ply:SpeciesState() == "freeform" then
			return {
				_base = {
					Model = ply:CharModel(),
					Skin = ply:CharSkin(),
				},
			}
		end

		local gender = GAMEMODE:GetGenderString(ply:CharModel())

		local data = {
			_base = {
				Model = ply:CharModel(),
				Skin = ply:CharSkin(),
			},
			torso = {
				Model = string.format("models/tnb/halflife/%s_torso_citizen.mdl", gender),
				Skin = 0
			},
			legs = {
				Model = string.format("models/tnb/halflife/%s_legs_jeans.mdl", gender)
			},
			hands = {
				Model = string.format("models/tnb/halflife/hands_%s.mdl", gender),
				Skin = GAMEMODE:GetModelSkinTone(ply:CharModel())
			}
		}

		return data
	end

	function CLASS:OverwriteFootsteps(ply, step, walking)
		local pants = ply:GetEquipment(EQUIPMENT_LEGS)

		if pants and string.StartWith(pants:GetClassName(), "clothing_legs_metropolice") and not walking then
			return step and "npc/metropolice/gear3.wav" or "npc/metropolice/gear4.wav", 0.2
		end
	end
end

return CLASS
