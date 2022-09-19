GM.Config.ServerName = "Half-Life: New America"

GM.Config.UIColors = {
	Border = Color(20, 20, 20),
	-- Fills
	FillLight = Color(60, 60, 60),
	FillMedium = Color(40, 40, 40),
	FillDark = Color(30, 30, 30),
	-- Primary color
	Primary = Color(150, 20, 20),
	PrimaryAlt = Color(100, 0, 0),
	PrimaryDark = Color(60, 0, 0),
	-- Text color
	TextNormal = Color(200, 200, 200),
	TextHover = Color(255, 255, 255),
	TextPrimary = Color(255, 0, 0),
	TextDisabled = Color(150, 150, 150),
	TextHighlight = Color(40, 40, 40),
	TextBad = Color(200, 0, 0),
	-- Other stuff
	MenuAlt = Color(50, 50, 50),
	MenuHovered = Color(70, 70, 70),
	TextEntry = Color(35, 35, 35),
	ItemDeny = Color(150, 20, 20),
	ItemAllow = Color(40, 150, 20),
}

GM.Config.PermaPropLimit = 3000

GM.Config.MaxCharacters = 20

GM.Config.MinNameLength = 3
GM.Config.MaxNameLength = 30

GM.Config.MaxDescLength 	= 2048

GM.Config.MaxPropDescLength = 255
GM.Config.MaxItemDescLength = 255

GM.Config.AllowedCharacters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ áàâäçéèêëíìîïóòôöúùûüÿÁÀÂÄßÇÉÈÊËÍÌÎÏÓÒÔÖÚÙÛÜŸ.-0123456789'"
GM.Config.AllowedTitleCharacters = "\'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ áàâäçéèêëíìîïóòôöúùûüÿÁÀÂÄßÇÉÈÊËÍÌÎÏÓÒÔÖÚÙÛÜŸ.-0123456789'"

GM.Config.DefaultCurrency = "currency_dollar"

-- Used for character creation and other character displays
GM.Config.IdleAnimations = {
	-- Half-Life 2 Models
	["models/vortigaunt.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_blue.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_doctor.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/vortigaunt_slave.mdl"] = {Sequence = "idle01", Offset = Vector(0, 3, -10)},
	["models/antlion.mdl"] = {Sequence = "distractidle2", Offset = Vector(40, -10, -40)},
	["models/antlion_worker.mdl"] = {Sequence = "distractidle2", Offset = Vector(55, -10, -40)},
	["models/headcrabclassic.mdl"] = {Offset = Vector(0, 0, -55)},
	["models/headcrab.mdl"] = {Offset = Vector(10, 0, -50)},
	["models/headcrabblack.mdl"] = {Sequence = "idle01", Offset = Vector(0, 0, -55)},
	["models/zombie/fast.mdl"] = {Sequence = "idle", Offset = Vector(30, 0, -20)},
	["models/zombie/poison.mdl"] = {Sequence = "idle01", Offset = Vector(20, 0, -20)},
	["models/zombie/classic_torso.mdl"] = {Sequence = "idle02", Offset = Vector(0, 5, -50)},
	["models/Zombie/classic.mdl"] = {Sequence = "idle01", Offset = Vector(0, 0, 0)},
	["models/antlion_guard.mdl"] = {Sequence = "idle", Offset = Vector(200, -60, 10)},
	["models/hunter.mdl"] = {Sequence = "idle_2", Offset = Vector(100, -30, 15)},
	["models/combine_scanner.mdl"] = {Sequence = "idle", Offset = Vector(65, -20, -60)},
	["models/shield_scanner.mdl"] = {Sequence = "hoverclosed", Offset = Vector(65, -20, -60)},
	-- TnB Creatures Pack
	["models/tor.mdl"] = {Sequence = "idle", Offset = Vector(50, -20, 15)},
	["models/half-life/islave.mdl"] = {Offset = Vector(0, 0, 20)},
	["models/half-life/panthereye.mdl"] = {Offset = Vector(0, 0, 20)},
	["models/charger/charger.mdl"] = {Offset = Vector(90, -20, -8)},
	-- TnB Combine Pack
	["combine_heavy_hlvr_player.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 12)},
	["combine_suppressor_hlvr_player.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 8)},
	["combine_elite_soldier_redone.mdl"] = {Sequence = "idle_all_01", Offset = Vector(0, 0, 2)},
	["synth_soldier.mdl"] = {Sequence = "idle_all_01", Offset = Vector(35, -12.5, 12.5)},
} 

GM.Config.ItemRange = {
	Dist = 1000,
	AimDist = 50
}

GM.Config.PlayerLabel = {
	Fade = 0.05,
	Desc = 64
}

GM.Config.ItemIconSize = 48
GM.Config.ItemIconMargin = 2

GM.Config.ChatSize = {600, 300}
GM.Config.ChatLimit = 500

GM.Config.ChatAliases = {
	["@"] = "/a",
	["//"] = "/ooc",
	["[["] = "/looc",
	[".//"] = "/looc",
	[":"] = "/me"
}
 
GM.Config.ConsoleAliases = {
	["bring"] = "rpa_bring",
	["goto"] = "rpa_goto",
	["send"] = "rpa_send",
	["tp"] = "rpa_tp",
	["kick"] = "rpa_kick",

	["roll"] = "rp_roll",
	["setcid"] = "rp_setcid",
	["onduty"] = "rp_onduty",
	["offduty"] = "rp_offduty"
}

GM.Config.ScoreboardCommands = {
	{"Kick", "rpa_kick"},
	{"Slap", "rpa_slap"},
	{"Toggle KO", function(ply) return IsValid(ply:GetRagdoll()) and "rpa_wake" or "rpa_ko" end},
	{"Toggle Muted", function(ply) return ply:OOCMuted() and "rpa_unmute" or "rpa_mute" end},
	{"Toggle Hidden", "rpa_hide"},
	{"Toggle Infinite ammo", function(ply) return ply:InfiniteAmmo() and "rpa_finiteammo" or "rpa_infiniteammo" end},
	{"Get Character ID", "rpa_charid"},
	{"Copy SteamID", "rpa_getinfo"},
	{"Heal", "rpa_heal"},
	{"Kill", "rpa_kill"},
	{"Goto", "rpa_goto"},
	{"Bring", "rpa_bring"},
	{"Teleport", "rpa_tp"},
	{"Edit Inventory", "rpa_editinventory"},
	{"Edit Stash", "rpa_editstash"}
}

GM.Config.ChatRanges = {
	Yell = 800,
	Speak = 400,
	Whisper = 150
}

GM.Config.ChatColors = {
	IC = Color(91, 166, 221),
	Emote = Color(131, 196, 251),
	Radio = Color(72, 118, 255),
	Language = Color(255, 167, 73),
	Yell = Color(255, 50, 50),
	OOC = Color(200, 0, 0),
	LOOC = Color(138, 185, 209),
	Error = Color(200, 0, 0),
	Notice = Color(229, 201, 98),
	Console = Color(0, 125, 255),
	AdminName = Color(255, 107, 218),
	AdminText = Color(255, 156, 230),
	Event = Color(0, 191, 255),
	LocalEvent = Color(255, 117, 48),
	PM = Color(160, 255, 160),
	Angry = Color(232, 20, 20),
	Advert = Color(205, 92, 92),
	Dispatch = Color(51, 51, 255),
	Broadcast = Color(204, 0, 0)
}

GM.Config.CollectionID 	= 2227514243
GM.Config.Website 		= "https://www.taconbanana.com/"

GM.Config.Workshop = {}
GM.Config.Workshop.Content 	= { 
	"773402917",    -- Advanced Duplicator Two
    "242776816",    -- Advanced Particle Controller
    "104604943",    -- Easy Bodygroup Tool
    "170917418",    -- Easy Bonemerge Tool
    "708225419",    -- Ladder Tool
    "746600040",    -- Material Editor Tool
    "405793043",    -- Submaterial Tool
    "264467687",    -- Improved Stacker Tool
    "217376234",    -- Collision Resizer Tool
    "120629004",    -- Animated Prop Tool
    "246756300",    -- 3D Stream Radio Tool
    "104482086",    -- Precision Tool
    "111158387",    -- Unbreakable Tool
    "195065185",    -- Easy Entity Inspector
    "741788352",    -- TankNut: Airwatch
    "822075881",    -- TankNut: Groundwatch
    "1525218777",   -- vFire Dynamic Fire
    "2056038710",    -- Half-Life: Alyx Combine Ration Models
    "104648051",    -- Half-Life 2 Driveables
    "760268522",    -- TnB Male Head Models
    "1834280942",    -- TnB Female Head Models
    "1557688329",    -- Eternity Models
    "771487490",    -- Simfphys Base
    "2024364495",    -- TnB HL2 Weapons (bennet)
    "760243326",    -- TnB HL2 Weapons (dave)
    "1318097828",    -- TnB Terminator RP Materials
    "760237654",    -- TnB Weapon Textures
    "873882787",    -- TnB Head Textures
    "215338015",    -- Map Content: Torrington
    "2182255612",    -- TNB - HLNA Clothes
    "2183417100",    -- TNB - HLNA Combine
    "2183818659",    -- TNB - HLNA Creatures
    "2183789121",    -- TNB - HLNA Resources
    "837571030",    -- City 2 Content
    "760262099",    -- hl2 models
    "2434141567",  -- HLNA Content
    "546392647", -- media player
    "2522754671", -- hl2na clothing extras
    "2505896097", -- hlna combine stuff
    "1154910118", -- terminator rp techcom models
    "760265535", -- hl2 clothing materials
    "105841291", -- more materials
    "760240464", -- tnb weapons - assault rifles and machineguns
    "760241983", -- tnb weapons - shotguns
    "760242725", -- tnb weapons - smgs, shotguns, pistols, sniper rifles, melee
    "1154906357", -- terminator rp weapon models
    "2196585204", -- tnb - extra weapons
    "646312597", -- tnb map content and props
    "760239128", -- tnb map textures
    "2387019275", -- tnb expanded models
    "2340192251", -- modular sewer system
    "2522754671", -- Revised Old Clothing
    "940903329", -- highway improb content
    "2611791235", -- tnb head models revised
    "2617473738", -- tnb clothing models revised
    "2617483552", -- tnb model materials
    "1639165791", -- warfare items
    "1206707188", -- gta props part 1
    "1206713009", -- gta props part 2
    "2233731395", -- scene builder
    "2848098852", -- tnb melee pack
    "2848025953", -- tnb rifles pack
    "2848021972", -- tnb pistols pack
    "2848014425", -- tnb shotguns pack
    "2848012059", -- tnb weapon base
    "2003814397", -- american truck simulator cars
    "1945909088", -- l4d vehicles
    "2447774443", -- stormfox 2
    "2864351128", -- the mist models
    "2600347219", -- fallout snpcs
    "2600378863", -- fallout snpcs models
    "131759821", -- vj base

}
GM.Config.Workshop.Maps = {}

GM.Config.ArmorLevels 	= {
	{DamageScale = 1,    Speed = 1.00 },
	{DamageScale = 0.75, Speed = 1.00 },
	{DamageScale = 0.65, Speed = 0.95 },
	{DamageScale = 0.55, Speed = 0.95 },
	{DamageScale = 0.45, Speed = 0.90 },
	{DamageScale = 0.35, Speed = 0.90 }
}

GM.Config.HitGroupMultipliers = {
	[HITGROUP_HEAD] = 1.75,
	[HITGROUP_LEFTARM] = 0.8,
	[HITGROUP_RIGHTARM] = 0.8,
	[HITGROUP_LEFTLEG] = 0.75,
	[HITGROUP_RIGHTLEG] = 0.75
}

GM.Config.ExamineRange = 1024
GM.Config.InteractRange = 82 -- Source default for +use

GM.Config.EntityRange = {
	Min = 100,
	Max = 256
}

GM.Config.SandboxLimits = {
	[TOOLTRUST_BASIC] = {
		props = 50,
		effects = 10,
		ragdolls = 0
	},
	[TOOLTRUST_ADVANCED] = {
		props = 150,
		effects = 20,
		ragdolls = 0
	}
}

GM.Config.SandboxLimitsExtra = {
	[DONATORPACKAGE_BRONZE] = {
		props = 50,
		effects = 10,
		ragdolls = 5
	},
	[DONATORPACKAGE_SILVER] = {
		props = 100,
		effects = 20,
		ragdolls = 10
	},
	[DONATORPACKAGE_GOLD] = {
		props = 200,
		effects = 50,
		ragdolls = 20
	}
}

GM.Config.SandboxBlacklist = {
	Props = {
		"models/props_explosive/",
		"models/props_c17/oildrum001_explosive.mdl",
		"models/props_junk/gascan001a.mdl",
		"models/props_junk/propane_tank001a.mdl",
		"models/props_combine/breen_tube.mdl",
		"models/props_combine/combine_bunker01.mdl",
		"models/props_combine/combine_tptimer.mdl",
		"models/props_combine/prison01.mdl",
		"models/props_combine/prison01c.mdl",
		"models/props_combine/prison01b.mdl",
		"models/props_phx/huge/",
		"models/props_phx/misc/",
		"models/props_phx/trains/",
		"models/props_phx/amraam.mdl",
		"models/props_phx/ball.mdl",
		"models/props_phx/mk-82.mdl",
		"models/props_phx/oildrum001_explosive.mdl",
		"models/props_phx/torpedo.mdl",
		"models/props_phx/ww2bomb.mdl",
		"models/props_equipment/oxygentank01.mdl",
		"models/props/industrial17/warehouse_e120_1.mdl"
	},
	Entities = {
		"animprop_spawn",
		"item_battery",
		"item_suitcharger"
	}
}

GM.Config.ProtectedEntities = {
	"prop_door_rotating",
	"func_*",
	"prop_dynamic*",
	"class C_BaseEntity"
}

GM.Config.PropRadius = {
	[TOOLTRUST_BASIC] = 200,
	[TOOLTRUST_ADVANCED] = 800
}

GM.Config.ToolTrust = {
	[TOOLTRUST_BASIC] = {
		"weld",
		"camera",
		"physprop",
		"remover",
		"colour",
		"material",
		"submaterial",
		"advmat",
		"nocollideworld"
	},
	[TOOLTRUST_ADVANCED] = {
		"axis",
		"ballsocket",
		"elastic",
		"hydraulic",
		"motor",
		"muscle",
		"pulley",
		"rope",
		"winch",
		"balloon",
		"button",
		"emitter",
		"hoverball",
		"lamp",
		"light",
		"nocollide",
		"thruster",
		"wheel",
		"eyeposer",
		"faceposer",
		"fingerposer",
		"paint",
		"particlecontrol",
		"particlecontrol_proj",
		"particlecontrol_tracer",
		"advdupe2",
		"precision",
		"precision_align",
		"weight",
		"stacker_improved",
		"streamradio",
		"streamradio_color",
		"unbreakable"
	}
}

GM.Config.HUDData = {
	Margin = 2,
	Offset = 20
}

GM.Config.NPCDrops = {
	["npc_headcrab"] = {0.25, "food_headcrabgib"},
	["npc_zombie"]   = {0.3, "food_headcrabgib"},
	["npc_zombie_torso"] = {0.3, "food_headcrabgib"},
	["npc_headcrab_fast"] = {0.35, "food_headcrabgib"},
	["npc_fastzombie"] = {0.35, "food_headcrabgib"},
	["npc_fastzombie_torso"] = {0.35, "food_headcrabgib"},
	["npc_headcrab_black"] = {0.35, "food_poisongib"},
	["npc_poisonzombie"] = {0.35, "food_poisongib"},
	["npc_antlion"] = {0.3, "food_antliongib"},
	["npc_antlionguard"] = {0.8, "food_guardgib"},
	["npc_crow"] = {0.25, "food_birdgib"},
	["npc_pigeon"] = {0.25, "food_birdgib"},
	["npc_seagull"] = {0.25, "food_birdgib"},
}

GM.Config.NPCSkill = {
	["npc_metropolice"] = WEAPON_PROFICIENCY_AVERAGE,
	["CombinePrison"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["PrisonShotgunner"] = WEAPON_PROFICIENCY_GOOD,
	["ShotgunSoldier"] = WEAPON_PROFICIENCY_GOOD,
	["CombineElite"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_combine_s"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["npc_turret_ceiling"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_turret_floor"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_alyx"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_barney"] = WEAPON_PROFICIENCY_PERFECT,
	["npc_citizen"] = WEAPON_PROFICIENCY_POOR,
	["npc_dog"] = WEAPON_PROFICIENCY_POOR,
	["npc_magnusson"] = WEAPON_PROFICIENCY_POOR,
	["npc_kleiner"] = WEAPON_PROFICIENCY_POOR,
	["npc_mossman"] = WEAPON_PROFICIENCY_POOR,
	["npc_eli"] = WEAPON_PROFICIENCY_POOR,
	["Medic"] = WEAPON_PROFICIENCY_AVERAGE,
	["npc_odessa"] = WEAPON_PROFICIENCY_AVERAGE,
	["Rebel"] = WEAPON_PROFICIENCY_GOOD,
	["Refugee"] = WEAPON_PROFICIENCY_AVERAGE,
	["VortigauntUriah"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["npc_vortigaunt"] = WEAPON_PROFICIENCY_VERY_GOOD,
	["VortigauntSlave"] = WEAPON_PROFICIENCY_VERY_GOOD,
}

GM.Config.NPCDamage = {
	["npc_antlion"] = 0.25,
	["npc_antlion_worker"] = 0.30,
	["npc_antlionguard"] = 0.5,
	["npc_antlionguardian"] = 0.4,
	["npc_barnacle"] = 0.5,
	["npc_headcrab_fast"] = 1,
	["npc_headcrab"] = 1,
	["npc_headcrab_black"] = 1,
	["npc_fastzombie"] = 0.5,
	["npc_fastzombie_torso"] = 1,
	["npc_zombie"] = 0.65,
	["npc_zombie_torso"] = 0.65,
	["npc_zombine"] = 0.35,
	["npc_poisonzombie"] = 0.25,
	["npc_cscanner"] = 0.3,
	["npc_manhack"] = 1,
	["npc_clawscanner"] = 0.3
}

GM.Config.NPCRelationships = {
	["npc_metropolice"] = RELATIONSHIP_METROPOLICE,
	["CombinePrison"] = RELATIONSHIP_COMBINESOLDIER,
	["PrisonShotgunner"] = RELATIONSHIP_COMBINESOLDIER,
	["ShotgunSoldier"] = RELATIONSHIP_COMBINESOLDIER,
	["CombineElite"] = RELATIONSHIP_COMBINESOLDIER,
	["npc_combine_s"] = RELATIONSHIP_COMBINESOLDIER,
	["npc_turret_ceiling"] = RELATIONSHIP_COMBINETURRET,
	["npc_turret_floor"] = RELATIONSHIP_COMBINETURRET,
	["npc_rollermine"] = RELATIONSHIP_COMBINETURRET,
	["npc_clawscanner"] = RELATIONSHIP_COMBINETURRET,
	["npc_cscanner"] = RELATIONSHIP_COMBINETURRET,
	["npc_combine_camera"] = RELATIONSHIP_COMBINETURRET,
	["npc_manhack"] = RELATIONSHIP_COMBINETURRET,
	["npc_helicopter"] = RELATIONSHIP_COMBINETURRET,
	["npc_combinedropship"] = RELATIONSHIP_COMBINESYNTH,
	["npc_combinegunship"] = RELATIONSHIP_COMBINESYNTH,
	["npc_hunter"] = RELATIONSHIP_COMBINESYNTH,
	["npc_strider"] = RELATIONSHIP_COMBINESYNTH,
	["npc_stalker"] = RELATIONSHIP_METROPOLICE,
	["npc_antlion"] = RELATIONSHIP_MONSTER,
	["npc_antlionguard"] = RELATIONSHIP_MONSTER,
	["npc_antlionguardian"] = RELATIONSHIP_MONSTER,
	["npc_antlion_worker"] = RELATIONSHIP_MONSTER,
	["npc_headcrab_fast"] = RELATIONSHIP_MONSTER,
	["npc_fastzombie"] = RELATIONSHIP_MONSTER,
	["npc_fastzombie_torso"] = RELATIONSHIP_MONSTER,
	["npc_headcrab"] = RELATIONSHIP_MONSTER,
	["npc_headcrab_black"] = RELATIONSHIP_MONSTER,
	["npc_poisonzombie"] = RELATIONSHIP_MONSTER,
	["npc_zombie"] = RELATIONSHIP_MONSTER,
	["npc_zombie_torso"] = RELATIONSHIP_MONSTER,
	["npc_zombine"] = RELATIONSHIP_MONSTER,
	["npc_alyx"] = RELATIONSHIP_RESISTANCE,
	["npc_barney"] = RELATIONSHIP_RESISTANCE,
	["npc_citizen"] = RELATIONSHIP_RESISTANCE,
	["npc_dog"] = RELATIONSHIP_RESISTANCE,
	["npc_magnusson"] = RELATIONSHIP_RESISTANCE,
	["npc_kleiner"] = RELATIONSHIP_RESISTANCE,
	["npc_mossman"] = RELATIONSHIP_RESISTANCE,
	["npc_eli"] = RELATIONSHIP_RESISTANCE,
	["Medic"] = RELATIONSHIP_RESISTANCE,
	["npc_odessa"] = RELATIONSHIP_RESISTANCE,
	["Rebel"] = RELATIONSHIP_RESISTANCE,
	["Refugee"] = RELATIONSHIP_RESISTANCE,
	["VortigauntUriah"] = RELATIONSHIP_RESISTANCE,
	["npc_vortigaunt"] = RELATIONSHIP_RESISTANCE,
	["VortigauntSlave"] = RELATIONSHIP_RESISTANCE,
	
}

GM.Config.RagdollTimeout = 300

GM.Config.BanRealm = "hl2"

GM.Config.StashSize = {4, 4}

GM.Config.DefaultLogs 	= 200
GM.Config.MaxLogs 		= 500

GM.Config.AFKKicker 	= {
	Enabled = false,
	Threshold = 0.90,
	Timer = 600
}

GM.Config.ConsciousnessRate = 0.75

GM.Config.HungerEnabled = true
GM.Config.HungerMax = 1000 -- Total number of hunger points.
GM.Config.HungerTick = 720 -- Minutes it takes to become "hungry" from 0 to max (12 hours)

GM.Config.CleanupTimer = 900 -- Seconds

-- ["item_to_change"] = "new_item" for deprecation of classes.
GM.Config.ItemRemappings = {
	["clothing_legs_cargo_black"] = "clothing_legs_cargopants",
	["clothing_legs_cargo_grey"] = "clothing_legs_cargopants",
	["clothing_legs_formal_white"] = "clothing_legs_suitpants",
	["clothing_legs_formal_black"] = "clothing_legs_suitpants",
	["clothing_legs_khaki_white"] = "clothing_legs_khaki",
	["clothing_legs_riot"] = "clothing_legs_riotgear",
	["clothing_torso_jacket_anorak"] = "clothing_torso_anorak",
	["clothing_torso_jacket_canvas"] = "clothing_torso_canvas",
	["clothing_torso_jacket_windbreaker"] = "clothing_torso_windbreaker",
	["clothing_torso_jacket_hooded"] = "clothing_torso_pinkhood",
	["clothing_torso_jacket_rain"] = "clothing_torso_rainjacket",
	["clothing_torso_jacket_fleece"] = "clothing_torso_fleece",
	["clothing_torso_jacket_thin"] = "clothing_torso_thinblack",
	["clothing_torso_shirt_plaid"] = "clothing_torso_plaidshirt",
	["clothing_torso_shirt_fancy"] = "clothing_torso_cleanshirt",
	["clothing_torso_overcoat_black"] = "clothing_torso_overcoat",
	["clothing_torso_overcoat_grey"] = "clothing_torso_overcoat",
	["clothing_torso_formal_white"] = "clothing_torso_suitjacket",
	["clothing_torso_formal_black"] = "clothing_torso_suitjacket",
	["clothing_torso_workshirt_blue"] = "clothing_torso_workshirt",
	["clothing_torso_workshirt_camo"] = "clothing_torso_workshirt",
	["clothing_torso_highvis_orange"] = "clothing_torso_highvis",
	["clothing_torso_highvis_yellow"] = "clothing_torso_highvis",
	["clothing_torso_shirt_green"] = "clothing_torso_citizenshirt",
	["clothing_torso_shirt_white"] = "clothing_torso_citizenshirt",
	["clothing_fullbody_trenchcoat"] = "clothing_torso_rebelovercoat",
	["clothing_torso_molle"] = "clothing_torso_rebelmolle",
	["clothing_torso_armor_blackvest"] = "clothing_torso_rebelpolice"
}

-- Allows custom functions to be run on player spawn.
GM.Config.SpecialItemFunctions = {
	["vortigaunt_shackles_disabled"] = {
		Class = "vortigaunt_shackles",
		Function = function(item) item:Break() end
	},
	["rationparcel_lowquality_sealed"] = {
		Class = "rationparcel_lowquality",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_standard_sealed"] = {
		Class = "rationparcel_standard",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_elevated_sealed"] = {
		Class = "rationparcel_elevated",
		Function = function(item) item:CreateInventory() end
	},
	["rationparcel_cota_nutrient_sealed"] = {
		Class = "rationparcel_cota_nutrient",
		Function = function(item) item:CreateInventory() end
	},
}

GM.Config.PlayerHulls = {
	Default = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 71)},
		Crouching = {Vector(-10, -10, 0), Vector(10, 10, 37)},
		ViewOffset = Vector(0, 0, 64),
		DuckedViewOffset = Vector(0, 0, 33)
	},
	["models/combine_scanner.mdl"] = {
		Standing = {Vector(-16, -16, -16), Vector(16, 16, 16)},
		ViewOffset = Vector(0, 0, 0)
	},
	["models/shield_scanner.mdl"] = {
		Standing = {Vector(-16, -16, -16), Vector(16, 16, 16)},
		ViewOffset = Vector(0, 0, 0)
	},
	["models/antlion.mdl"] = {
		Standing = {Vector(-16, -16, 0), Vector(16, 16, 64)},
		ViewOffset = Vector(0, 0, 32)
	},
	["models/antlion_worker.mdl"] = {
		Standing = {Vector(-16, -16, 0), Vector(16, 16, 64)},
		ViewOffset = Vector(0, 0, 32)
	},
	["models/antlion_guard.mdl"] = {
		Standing = {Vector(-40, -40, 0), Vector(40, 40, 100)},
		ViewOffset = Vector(0, 0, 70)
	},
	["models/gargantua.mdl"] = {
		Standing = {Vector(-80, -80, 0), Vector(80, 80, 220)},
		ViewOffset = Vector(0, 0, 125)
	},
	["models/babygarg.mdl"] = {
		Standing = {Vector(-40, -40, 0), Vector(40, 40, 120)},
		ViewOffset = Vector(0, 0, 65)
	},
	["models/half-life/big_mom.mdl"] = {
		Standing = {Vector(-100, -100, 0), Vector(100, 100, 190)},
		ViewOffset = Vector(0, 0, 160)
	},
	["models/opfor/gonome.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 90)},
		ViewOffset = Vector(0, 0, 75)
	},
	["models/half-life/agrunt.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 90)},
		ViewOffset = Vector(0, 0, 80)
	},
	["models/headcrabclassic.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 15)},
		ViewOffset = Vector(0, 0, 10)
	},
	["models/headcrab.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 25)},
		ViewOffset = Vector(0, 0, 20)
	},
	["models/headcrabblack.mdl"] = {
		Standing = {Vector(-15, -15, 0), Vector(15, 15, 15)},
		ViewOffset = Vector(0, 0, 10)
	},
	["models/half-life/kingpin.mdl"] = {
		Standing = {Vector(-35, -35, 0), Vector(35, 35, 120)},
		ViewOffset = Vector(0, 0, 80)
	},
	["models/half-life/panthereye.mdl"] = {
		Standing = {Vector(-15, -15, 0), Vector(15, 15, 50)},
		ViewOffset = Vector(0, 0, 35),
		DuckedViewOffset = Vector(0, 0, 25)
	},
	["models/half-life/islave.mdl"] = {
		Standing = {Vector(-10, -10, 0), Vector(10, 10, 65)},
		ViewOffset = Vector(0, 0, 45)
	},
	["models/tor.mdl"] = {
		Standing = {Vector(-20, -20, 0), Vector(20, 20, 95)},
		ViewOffset = Vector(0, 0, 75)
	},
	["models/zombie/fast_torso.mdl"] = {
		Standing = {Vector(-12, -12, 0), Vector(12, 12, 24)},
		ViewOffset = Vector(0, 0, 15)
	},
	["models/zombie/classic_torso.mdl"] = {
		Standing = {Vector(-12, -12, 0), Vector(12, 12, 24)},
		ViewOffset = Vector(0, 0, 15)
	}
}

GM.Config.DropOnDeath = false

GM.Config.PermissionWhitelist = {
	[PERMISSION_VEHICLES] = {
		"sim_fphys_hlna_cherokee", -- Civil Police Cherokee
		"sim_fphys_pwavia", -- HL2 Avia
		"sim_fphys_pwgaz52", -- HL2 GAZ52
		"sim_fphys_pwhatchback", -- HL2 Golf
		"sim_fphys_pwliaz", -- HL2 Liaz
		"sim_fphys_pwmoskvich", -- HL2 Moskvich
		"sim_fphys_pwtrabant", -- HL2 Trabant
		"sim_fphys_pwtrabant02", -- HL2 Trabant 2
		"sim_fphys_pwvan", -- HL2 Van
		"sim_fphys_pwvolga", -- HL2 Volga
		"sim_fphys_pwzaz", -- HL2 ZAZ
		"sim_fphys_van", -- Synergy Van
		"sim_fphys_l4d_69sedan",
		"sim_fphys_l4d_pickup_b_78",
		"sim_fphys_l4d_pickup_78",
		"sim_fphys_l4d_82hatchback",
		"sim_fphys_l4d_84sedan",
		"sim_fphys_l4d_95sedan",
		"sim_fphys_l4d_suv_2001",
		"sim_fphys_l4d_pickup_2004",
		"sim_fphys_l4d_crownvic",
		"sim_fphys_l4d_pickup_4x4",
		"sim_fphys_l4d_pickup_dually",
		"sim_fphys_l4d_pickup_regcab",
		"sim_fphys_l4d_van",
		"sim_fphys_l4d_police_pickup2",
		"sim_fphys_l4d_police_pickup",
		"sim_fphys_l4d_police_city2",
		"sim_fphys_l4d_police_rural",
		"sim_fphys_l4d_apcat2",
		"sim_fphys_l4d_truck_nuke",
		"sim_fphys_l4d_apcat",
		"sim_fphys_l4d_deliveryvan",
		"sim_fphys_l4d_flatnose_truck",
		"sim_fphys_l4d_apfuel_truck",
		"sim_fphys_l4d_longnose_truck",
		"sim_fphys_l4d_m_van",
		"sim_fphys_l4d_news_van",
		"sim_fphys_l4d_semi_truck",
		"sim_fphys_l4d_taxi_old",
		"sim_fphys_l4d_taxi_rural",
		"sim_fphys_l4d_utility_truck",
	},
	[PERMISSION_CMBVEHICLES] = {
		"ctv_hla_prisoner_transport",
		"sim_fphys_l4d_police_city2",
		"sim_fphys_l4d_police_rural",
		"sim_fphys_l4d_police_pickup2",
		"sim_fphys_hlna_cherokee",
		"ent_apc"
	}
}

GM.Config.SkinTones = {
	["models/tnb/heads/trp/male_01.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_03.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_13.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_32.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_49.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/male_77.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_03.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_45.mdl"] = SKINTONE_BLACK,
	["models/tnb/heads/trp/female_53.mdl"] = SKINTONE_BLACK,
}
