local CLASS = class.Create("base_species")

CLASS.Name 					= "Xenian Event Character"
CLASS.Team 					= TEAM_XENIANS

CLASS.BaseHealth 			= 100

CLASS.WeaponLoadout 		= {"eternity_melee_hands"}
CLASS.PlayerModels 			= {
	Model("models/headcrabclassic.mdl")
}

CLASS.IgnoreHungerEffects	= true

CLASS.OverrideWorldArea		= true

CLASS.Voicelines 			= {
	["Alert"] = "npc/headcrab/alert1.wav",
	["Idle"] = "npc/headcrab/idle3.wav"
}

CLASS.DisabledProperties 	= {
	["RPName"] = true,
	["Description"] = true,
	["SecondLanguage"] = true
}

CLASS.AllowStash 			= false
CLASS.NoFallDamage 			= true
CLASS.GasImmune 			= true

CLASS.EquipmentSlots 		= {EQUIPMENT_XENIAN}

CLASS.MoveSpeed 			= {
	Walk = 50,
	Run = 100,
	Jump = 310,
	Crouch = 50
}

CLASS.SpeciesDefaults		= {
	CombinePermissions = {},
	CombineLevel = COMBINE_LEVEL_CITIZEN,
	VisibleRPName = nil,
	ForceTeam = TEAM_XENIANS,
	DisallowTeamItems = true,
	UseTeamSpawn = true,
}

CLASS.SpeciesStates			= { }

function CLASS:GetVoicelines(ply)
	local item = ply:GetEquipment(EQUIPMENT_XENIAN)

	if item and item.Voicelines then
		return item.Voicelines
	end

	return self.Voicelines
end

function CLASS:Loadout(ply)
	for _, v in pairs(self.WeaponLoadout) do
		ply:Give(v)
	end

	local item = ply:GetEquipment(EQUIPMENT_XENIAN)

	if item and item.Loadout then
		item:Loadout(ply)
	end
end

if SERVER then
	function CLASS:OverwriteFootsteps(ply, step, walking)
		local item = ply:GetEquipment(EQUIPMENT_XENIAN)

		if not item then
			return "NPC_Headcrab.Footstep", 0.05
		else
			return item:OverwriteFootsteps(ply, step, walking)
		end
	end

	function CLASS:InitialSetup(ply)
		ply:SetActiveLanguage(LANG_ENG)
		ply:GiveLanguage(LANG_XENI)

		ply:SetRPName("Xenian Event Character")
	end

	function CLASS:GetSpeeds(ply)
		return self.MoveSpeed.Walk, self.MoveSpeed.Run, self.MoveSpeed.Jump, self.MoveSpeed.Crouch
	end

	function CLASS:SetupHands(ply, ent)
		local mdl = "models/weapons/c_arms_refugee.mdl"

		ent:SetModel(mdl)
		ent:SetSkin(2)
		ent:SetBodyGroups("00000000")
	end
end

return CLASS
