local CLASS = class.Create("base_species")

CLASS.Name 					= "Combine Airwatch: SCANNER"
CLASS.Team 					= TEAM_AIRWATCH

CLASS.ForceTeamSpawn		= true

CLASS.BaseHealth 			= 150
CLASS.ArmorLevel            = ARMOR_LIGHT

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/Combine_Scanner.mdl")
}

CLASS.IgnoreHungerEffects	= true

CLASS.OverrideWorldArea		= true

CLASS.Voicelines 			= {
    ["Photograph Sound"] = "npc/scanner/scanner_photo1.wav",
    ["Scan 1"] = "npc/scanner/scanner_scan1.wav",
    ["Scan 2"] = "npc/scanner/scanner_scan2.wav",
    ["Scan 3"] = "npc/scanner/scanner_scan4.wav",
    ["Scan 4"] = "npc/scanner/scanner_scan5.wav",
    ["Pain 1"] = "npc/scanner/scanner_pain1.wav",
    ["Pain 2"] = "npc/scanner/scanner_pain2.wav",
    ["Siren"] = "npc/scanner/scanner_siren2.wav",
    ["Combat Scan 1"] = "npc/scanner/combat_scan1.wav",
    ["Combat Scan 2"] = "npc/scanner/combat_scan2.wav",
    ["Combat Scan 3"] = "npc/scanner/combat_scan3.wav",
    ["Combat Scan 4"] = "npc/scanner/combat_scan4.wav",
    ["Combat Scan 5"] = "npc/scanner/combat_scan5.wav",
    ["Servo 1"] = "npc/scanner/cbot_servochatter.wav",
    ["Servo 2"] = "npc/scanner/cbot_servoscared.wav",
}

CLASS.DisabledProperties 	= {
	["RPName"] = true,
    ["Description"] = true,
    ["SecondLanguage"] = true,
    ["CharSkin"] = true
}

CLASS.AllowStash 			= false
CLASS.NoFallDamage 			= true
CLASS.GasImmune 			= true

CLASS.ArmorLevel            = ARMOR_LIGHT

CLASS.EquipmentSlots 		= {EQUIPMENT_COMBINE}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO}

CLASS.SpawnOffset           = Vector(0, 0, 32)

CLASS.MoveSpeed 			= {
	Walk = 180,
	Run = 180,
	Jump = 0,
	Crouch = 0
}

CLASS.CustomMove            = true

CLASS.BlockNameChange		= true

CLASS.DeathSounds 			= {
	"npc/scanner/cbot_energyexplosion1.wav"
}

CLASS.SpeciesDefaults		= {
	CombinePermissions = {
		[COMBINE_DOORS_NEXUS] = true,
		[COMBINE_DOORS_LOCKS] = true,
		[COMBINE_TECHNOLOGY_FORCEFIELD] = true
	},
	CombineLevel = COMBINE_LEVEL_UPPERASSET,
    VisibleRPName = function(ply, scoreboard) 
        local model = ply:GetEquipment(EQUIPMENT_COMBINE)

        if model and model:GetClassName() == "scanner_claw" then
            return string.format("AW.S22-SKYSHIELD.%s", ply:VisibleCitizenNumber()) 
        end

        return string.format("AW.C107-SKYSHIELD.%s", ply:VisibleCitizenNumber()) 
    end,
	ForceTeam = TEAM_AIRWATCH,
	DisallowTeamItems = true,
	UseTeamSpawn = true,
}

CLASS.SpeciesStates = { }

if SERVER then
	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)

		ply:SetRPName("Combine Airwatch: SCANNER")
    end

    function CLASS:OnSpawn(ply)
        ply:SetBloodColor(DONT_BLEED)
        ply:SetMoveType(MOVETYPE_FLY)
        ply:SetMoveCollide(MOVECOLLIDE_FLY_BOUNCE)
        ply:SetGravity(0)
        ply:SetHull(Vector(-16,-16,-16), Vector(16,16,16))
    end

    function CLASS:OnDeath(ply)
        local explo = ents.Create("env_explosion")
        explo:SetPos(ply:GetPos())
        explo:SetKeyValue("spawnflags", "1")
        explo:Spawn()
        explo:Activate()
        explo:Fire("Explode")
    
        ply:EmitSound("npc/scanner/scanner_siren1.wav")
    
		self:HandleDeathSounds(ply)
    end
    
    function CLASS:Move(ply, move)
        local moveType = ply:GetMoveType()

        if moveType ~= MOVETYPE_NOCLIP and moveType ~= MOVETYPE_FLY then
            ply:SetMoveType(MOVETYPE_FLY)
        end
    
        local bobamount = Vector(math.sin(CurTime()) / 12,math.cos(CurTime()) / 12, math.sin(CurTime()) / 20)
    
        move:SetVelocity(Vector(ply:GetVelocity().x * 0.98 + bobamount.x, ply:GetVelocity().y * 0.98 + bobamount.y, ply:GetVelocity().z * 0.98 + bobamount.z))
    
        if move:KeyDown(IN_JUMP) then
            move:SetVelocity(Vector(ply:GetVelocity().x * 0.98, ply:GetVelocity().y * 0.98, ply:GetVelocity().z * 0.90 + 10))
        end
    
        if move:KeyDown(IN_SPEED) then
            move:SetVelocity(Vector(ply:GetVelocity().x * 0.98, ply:GetVelocity().y * 0.98, ply:GetVelocity().z * 0.90 - 10))
        end
    end
    
	function CLASS:OverwriteFootsteps(ply, step, walking)
        return step and "tnb/halflife2/combine/tyrant_step01.wav" or "tnb/halflife2/combine/tyrant_step02.wav", 0.0
	end

    function CLASS:GetModelData(ply)
        local equipment = ply:GetEquipment(EQUIPMENT_COMBINE)

        if not equipment then
            entsound.Play(ply, ENTSOUND_IDLE, "npc/scanner/scanner_scan_loop1.wav", 1.25)

            if ply:IsInNoClip() then
                entsound.Silence(ply)
            end
        else
            entsound.Play(ply, ENTSOUND_IDLE, "npc/scanner/combat_scan_loop1.wav", 1.25)

            if ply:IsInNoClip() then
                entsound.Silence(ply)
            end
        end

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