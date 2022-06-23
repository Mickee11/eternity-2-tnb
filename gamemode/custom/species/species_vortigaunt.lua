local CLASS = class.Create("base_species")

CLASS.Name 					= "Vortigaunt"
CLASS.Team 					= TEAM_VORTIGAUNT
 
CLASS.InventorySize 		= {9, 8}

CLASS.BaseHealth 			= 150

CLASS.WeaponLoadout 		= {"eternity_melee_vortigaunt", "eternity_melee_vortbroom"}
CLASS.PlayerModels 			= {
    Model("models/vortigaunt.mdl"),
    Model("models/vortigaunt_slave.mdl")
}

CLASS.UnderstandLanguages   = true

CLASS.SpeciesStates = {
    ["free"] = { },
    ["slave"] = {
        CombinePermissions = {
            [COMBINE_DOORS_LOCKS] = true,
            [COMBINE_RATION_LOWQUALITY] = true,
        },
        CombineLevel = COMBINE_LEVEL_CITIZEN,
        VisibleRPName = function(ply, scoreboard) return string.format("C107-SERVITOR.%s", ply:VisibleCitizenNumber()) end,
    }
}

CLASS.ArmorLevel 			= ARMOR_LIGHT

CLASS.DisabledProperties 	= {
    ["CharSkin"] = true,
    ["SecondLanguage"] = true,
}

CLASS.AllowStash 			= true
CLASS.GasImmune 			= true

CLASS.EquipmentSlots 		= {EQUIPMENT_VORTIGAUNT}
CLASS.WeaponSlots 			= {EQUIPMENT_RADIO}

CLASS.MoveSpeed 			= {
	Walk = 80,
	Run = 220,
	Jump = 210,
	Crouch = 80
}

CLASS.Gestures				= {
	["Cough"] = "gest_cough",
	["Stomp"] = "stomp",
	["Follow"] = "g_follow_me",
	["Pray"] = "g_handclasp",
    ["Heal"] = "gest_heal"
}

if CLIENT then
	function CLASS:ProcessPreview(ent, pnl)
		part.Clear(ent)

		pnl.PreDrawModel = function()
			ent:DrawModel()

			return false
		end
	end
end

if SERVER then
    function CLASS:OnStateChanged(ply, old, new)
        local appearance = ply:GetEquipment(EQUIPMENT_VORTIGAUNT)

        if not appearance then
            return
        end

        if appearance:GetClassName() == "vortigaunt_shackles" and new == "free" then
            appearance:Break()

            ply:SendChat("NOTICE", "The restrictors you wear may now be taken off")
        end
    end

	function CLASS:InitialSetup(ply)
        ply:SetActiveLanguage(LANG_ENG)
        ply:GiveLanguage(LANG_VORT)

        local mdl = ply:CharModel()

        if string.find(mdl, "slave") == nil then
            ply:SetSpeciesState("free")
        else
            ply:SetSpeciesState("slave")
            
            local credits = 50

            local package = self:TopDonatorPackage()
    
            if package and DONATORPACKAGES[package].Credits then
                credits = credits + DONATORPACKAGES[package].Credits
            end
    
            ply:GiveItem("currency_credits", credits)

            local item = GAMEMODE:CreateItem("vortigaunt_shackles")
            item:DisableEquipNotification()

            ply:GetInventory(EQUIPMENT_VORTIGAUNT):AddItem(item, 1, 1)
            ply:HandlePlayerModel()
        end
    end
      
	function CLASS:OverwriteFootsteps(ply, step, walking)
		if not walking then
			return step and "NPC_Vortigaunt.FootstepLeft" or "NPC_Vortigaunt.FootstepRight", 0.1 
		end
	end

    function CLASS:GetModelData(ply)        
		local data = {
			_base = {
				Model = Model("models/vortigaunt.mdl"),
			}
		}

		return data
    end
    
	function CLASS:SetupHands(ply, ent)
		local mdl = "models/weapons/c_arms_hev.mdl"

		ent:SetModel(mdl)
		ent:SetSkin(0)
		ent:SetBodyGroups("00000000")
	end
end

return CLASS