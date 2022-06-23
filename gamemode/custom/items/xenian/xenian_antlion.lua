ITEM = class.Create("base_xenian")

ITEM.Name 				= "Antlion"
ITEM.Description 		= "The creature responsible for taking Lazlo from us long before his time was up."

ITEM.Model 				= Model("models/gibs/antlion_gib_large_2.mdl")

ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Voicelines 	= {
	["Distract"] = "npc/antlion/distract1.wav",
	["Idle"] = {
		"npc/antlion/idle1.wav",
		"npc/antlion/idle2.wav",
		"npc/antlion/idle3.wav",
		"npc/antlion/idle4.wav",
		"npc/antlion/idle5.wav"
	}
}

function ITEM:OnEquip(ply, slot, loading)
	self:ParentCall("OnEquip", ply, slot, loading)

	if SERVER then
		ply:SetBloodColor(BLOOD_COLOR_ANTLION)
	end
end

function ITEM:OnUnequip(ply, slot, unloading)
	self:ParentCall("OnUnequip", ply, slot, unloading)

	if SERVER then
		ply:SetBloodColor(BLOOD_COLOR_RED)
	end

	ply:StopSound("antlion_flight_loop")
	ply:StopSound("antlion_flight_land")
end

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 195, 355, 410, 45
	end

	function ITEM:Loadout(ply)
		ply:Give("eternity_xen_antlion")
	end

	function ITEM:OnDeath(ply)
		ply:StopSound("antlion_flight_loop")
		ply:StopSound("antlion_flight_land")
	end

	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/antlion.mdl"),
				Skin = math.random(0, 3)
			}
		}
	end

	function ITEM:OverwriteFootsteps(ply, step, walking)
		return "NPC_Antlion.Footstep"
	end
end

sound.Add({
	name = "antlion_flight_loop",
	channel = CHAN_STREAM,
	volume = 1.0,
	level = 75,
	pitch = 100,
	sound = "npc/antlion/fly1.wav"
})

sound.Add({
	name = "antlion_flight_land",
	channel = CHAN_AUTO,
	volume = 1.0,
	level = 75,
	pitch = 100,
	sound = "npc/antlion/land1.wav"
})

return ITEM
