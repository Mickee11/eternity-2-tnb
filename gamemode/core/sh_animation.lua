GM.AnimTable = {}

function GM:AddAnimTable(models, holstered, unholstered)
	if not istable(models) then
		models = {models}
	end

	for _, v in pairs(models) do
		local mdl = string.lower(v)

		self.AnimTable[mdl] = holstered

		if unholstered then
			self.AnimTable[mdl]["_UNHOLSTERED"] = unholstered
		end
	end
end

GM:AddAnimTable({
	"models/combine_soldier.mdl",
	"models/combine_soldier_prisonguard.mdl",
	"models/combine_super_soldier.mdl",
	"models/tnb/combine/specops.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= "walk_all",
	[ACT_MP_RUN] 						= ACT_RUN_RIFLE,
	[ACT_MP_CROUCH_IDLE] 				= ACT_COVER,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK_CROUCH_RIFLE,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_JUMP,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
}, {
	[ACT_MP_STAND_IDLE] 				= "combatidle1_smg1",
	[ACT_MP_WALK] 						= "walk_aiming_all",
	[ACT_MP_RUN] 						= ACT_RUN_AIM_RIFLE,
	[ACT_MP_CROUCH_IDLE] 				= "CrouchIdle",
	[ACT_MP_CROUCHWALK] 				= ACT_WALK_CROUCH_RIFLE,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "gesture_shoot_ar2",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= "gesture_shoot_ar2",
	[ACT_MP_RELOAD_STAND] 				= "gesture_reload",
	[ACT_MP_RELOAD_CROUCH] 				= "gesture_reload",
	[ACT_MP_JUMP] 						= ACT_JUMP,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE_ANGRY,
	[ACT_MP_SWIM] 						= ACT_IDLE_ANGRY,
	[ACT_LAND] 							= ACT_IDLE_ANGRY
})

GM:AddAnimTable({
	"models/vortigaunt.mdl",
	"models/vortigaunt_slave.mdl",
	"models/vortigaunt_doctor.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= "CrouchIdle",
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE_ANGRY,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= "CrouchIdle",
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE_ANGRY,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= ACT_IDLE_ANGRY,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE_ANGRY,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE_ANGRY,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE_ANGRY,
	[ACT_MP_SWIM] 						= ACT_IDLE_ANGRY,
	[ACT_LAND] 							= ACT_IDLE_ANGRY
})

GM:AddAnimTable({
	"models/pigeon.mdl",
	"models/crow.mdl",
	"models/seagull.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_HOP,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/shield_scanner.mdl", {
	[ACT_MP_STAND_IDLE] 				= "hoverclosed",
	[ACT_MP_WALK] 						= "hoverclosed",
	[ACT_MP_RUN] 						= "hoverclosed",
	[ACT_MP_CROUCH_IDLE] 				= "hoverclosed",
	[ACT_MP_CROUCHWALK] 				= "hoverclosed",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "hoverclosed",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "hoverclosed",
	[ACT_MP_RELOAD_STAND] 				= "hoverclosed",
	[ACT_MP_RELOAD_CROUCH] 				= "hoverclosed",
	[ACT_MP_JUMP] 						= "hoverclosed",
	[ACT_MP_SWIM_IDLE] 					= "hoverclosed",
	[ACT_MP_SWIM] 						= "hoverclosed",
	[ACT_LAND] 							= "hoverclosed"
})

GM:AddAnimTable("models/hunter.mdl", {
	[ACT_MP_STAND_IDLE] 				= "idle1",
	[ACT_MP_WALK] 						= "walk_all",
	[ACT_MP_RUN] 						= "canter_all",
	[ACT_MP_CROUCH_IDLE] 				= "idle_planted",
	[ACT_MP_CROUCHWALK] 				= "prowl_all",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "meleeleft",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "shoot_minigun",
	[ACT_MP_RELOAD_STAND] 				= "idle1",
	[ACT_MP_RELOAD_CROUCH] 				= "idle_planted",
	[ACT_MP_JUMP] 						= "canter_all",
	[ACT_MP_SWIM_IDLE] 					= "hoverclosed",
	[ACT_MP_SWIM] 						= "hoverclosed",
	[ACT_LAND] 							= "drop_down"
})

GM:AddAnimTable("models/headcrabclassic.mdl", {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_RUN,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_RUN,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "drown",
	[ACT_MP_SWIM_IDLE] 					= "drown",
	[ACT_MP_SWIM] 						= "drown",
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/headcrab.mdl", {
	[ACT_MP_STAND_IDLE] 				= "idle01",
	[ACT_MP_WALK] 						= ACT_RUN,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= "idle02",
	[ACT_MP_CROUCHWALK] 				= ACT_RUN,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "drown",
	[ACT_MP_SWIM_IDLE] 					= "drown",
	[ACT_MP_SWIM] 						= "drown",
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/headcrabblack.mdl", {
	[ACT_MP_STAND_IDLE] 				= "idle01fast",
	[ACT_MP_WALK] 						= "walk_all",
	[ACT_MP_RUN] 						= "scurry",
	[ACT_MP_CROUCH_IDLE] 				= "idlesniff",
	[ACT_MP_CROUCHWALK] 				= "walk_all",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "idle01fast",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "idle01fast",
	[ACT_MP_RELOAD_STAND] 				= "idle01fast",
	[ACT_MP_RELOAD_CROUCH] 				= "idle01fast",
	[ACT_MP_JUMP] 						= "drown",
	[ACT_MP_SWIM_IDLE] 					= "drown",
	[ACT_MP_SWIM] 						= "drown",
	[ACT_LAND] 							= "idle01fast"
})

GM:AddAnimTable({
	"models/zombie/classic.mdl",
	"models/zombie/classic_torso.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_WALK,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_WALK,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/Zombie/Fast.mdl", {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "leapstrike",
	[ACT_MP_SWIM_IDLE] 					= "leapstrike",
	[ACT_MP_SWIM] 						= "leapstrike",
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/zombie/fast_torso.mdl", {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_WALK,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "leapstrike",
	[ACT_MP_SWIM_IDLE] 					= "leapstrike",
	[ACT_MP_SWIM] 						= "leapstrike",
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/Zombie/Poison.mdl", {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= "run",
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_IDLE,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/zombie/zombie_soldier.mdl", {
	[ACT_MP_STAND_IDLE] 				= "idle01",
	[ACT_MP_WALK] 						= "walk_all",
	[ACT_MP_RUN] 						= "run_all",
	[ACT_MP_CROUCH_IDLE] 				= "idle01",
	[ACT_MP_CROUCHWALK] 				= "walk_all",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "run_all",
	[ACT_MP_SWIM_IDLE] 					= "run_all",
	[ACT_MP_SWIM] 						= "run_all",
	[ACT_LAND] 							= ACT_IDLE
}, {
	[ACT_MP_STAND_IDLE] 				= "idle_grenade",
	[ACT_MP_WALK] 						= "walk_all_grenade",
	[ACT_MP_RUN] 						= "run_all_grenade",
	[ACT_MP_CROUCH_IDLE] 				= "idle_grenade",
	[ACT_MP_CROUCHWALK] 				= "walk_all_grenade",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "run_all_grenade",
	[ACT_MP_SWIM_IDLE] 					= "run_all_grenade",
	[ACT_MP_SWIM] 						= "run_all_grenade",
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable({
	"models/antlion.mdl",
	"models/antlion_worker.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_JUMP,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

GM:AddAnimTable("models/antlion_guard.mdl", {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= "charge_loop",
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_JUMP,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

-- TNB - HLNA Creatures (generic)
GM:AddAnimTable({
	"models/half-life/bullsquid.mdl",
	"models/devilsquid.mdl",
	"models/frostsquid.mdl",
	"models/poisonsquid.mdl",
	"models/tor.mdl",
	"models/half-life/agrunt.mdl",
	"models/half-life/big_mom.mdl",
	"models/half-life/kingpin.mdl",
	"models/charger/charger.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

-- TNB - HLNA Creatures (Vortigore)
GM:AddAnimTable("models/opfor/gonome.mdl", {
	[ACT_MP_STAND_IDLE] 				= "idle2",
	[ACT_MP_WALK] 						= "walk",
	[ACT_MP_RUN] 						= "runshort",
	[ACT_MP_CROUCH_IDLE] 				= "idle2",
	[ACT_MP_CROUCHWALK] 				= "walk",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "idle2",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "idle2",
	[ACT_MP_RELOAD_STAND] 				= "idle2",
	[ACT_MP_RELOAD_CROUCH] 				= "idle2",
	[ACT_MP_JUMP] 						= "runlong",
	[ACT_MP_SWIM_IDLE] 					= "idle2",
	[ACT_MP_SWIM] 						= "idle2",
	[ACT_LAND] 							= "idle2"
})

-- TNB - HLNA Creatures (gargantua)
GM:AddAnimTable({
	"models/babygarg.mdl",
	"models/gargantua.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "idle3",
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

-- TNB - HLNA Creatures (chumtoad)
GM:AddAnimTable({
	"models/half-life/chumtoad.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_IDLE,
	[ACT_MP_WALK] 						= "hop_1",
	[ACT_MP_RUN] 						= "hop_2",
	[ACT_MP_CROUCH_IDLE] 				= ACT_IDLE,
	[ACT_MP_CROUCHWALK] 				= "hop_1",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_IDLE,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= "hop_2",
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

-- TNB - HLNA Creatures (controller)
GM:AddAnimTable({
	"models/half-life/controller.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= ACT_WALK,
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_WALK,
	[ACT_MP_CROUCH_IDLE] 				= ACT_WALK,
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_WALK,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_WALK,
	[ACT_MP_RELOAD_STAND] 				= ACT_WALK,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_WALK,
	[ACT_MP_JUMP] 						= ACT_WALK,
	[ACT_MP_SWIM_IDLE] 					= ACT_WALK,
	[ACT_MP_SWIM] 						= ACT_WALK,
	[ACT_LAND] 							= ACT_WALK
})

-- TNB - HLNA Creatures (houndeye)
GM:AddAnimTable({
	"models/half-life/houndeye.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "idle2",
	[ACT_MP_WALK] 						= ACT_WALK,
	[ACT_MP_RUN] 						= ACT_RUN,
	[ACT_MP_CROUCH_IDLE] 				= "idle2",
	[ACT_MP_CROUCHWALK] 				= ACT_WALK,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "idle2",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "idle2",
	[ACT_MP_RELOAD_STAND] 				= "idle2",
	[ACT_MP_RELOAD_CROUCH] 				= "idle2",
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= "idle2",
	[ACT_MP_SWIM] 						= "idle2",
	[ACT_LAND] 							= "idle2"
})

-- TNB - HLNA Creatures (islave)
GM:AddAnimTable({
	"models/half-life/islave.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "idle3",
	[ACT_MP_WALK] 						= "walk1",
	[ACT_MP_RUN] 						= "run1",
	[ACT_MP_CROUCH_IDLE] 				= "idle3",
	[ACT_MP_CROUCHWALK] 				= "walk1",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "idle3",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "idle3",
	[ACT_MP_RELOAD_STAND] 				= "idle3",
	[ACT_MP_RELOAD_CROUCH] 				= "idle3",
	[ACT_MP_JUMP] 						= "run1",
	[ACT_MP_SWIM_IDLE] 					= "idle3",
	[ACT_MP_SWIM] 						= "idle3",
	[ACT_LAND] 							= "idle3"
})

-- TNB - HLNA Creatures (mrfriendly)
GM:AddAnimTable({
	"models/half-life/mrfriendly.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "idle1",
	[ACT_MP_WALK] 						= "walk",
	[ACT_MP_RUN] 						= "walk",
	[ACT_MP_CROUCH_IDLE] 				= "idle1",
	[ACT_MP_CROUCHWALK] 				= "walk",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "idle1",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "idle1",
	[ACT_MP_RELOAD_STAND] 				= "idle1",
	[ACT_MP_RELOAD_CROUCH] 				= "idle1",
	[ACT_MP_JUMP] 						= "walk",
	[ACT_MP_SWIM_IDLE] 					= "idle1",
	[ACT_MP_SWIM] 						= "idle1",
	[ACT_LAND] 							= "idle1"
})

-- TNB - HLNA Creatures (panthereye)
GM:AddAnimTable({
	"models/half-life/panthereye.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "itch",
	[ACT_MP_WALK] 						= "walk",
	[ACT_MP_RUN] 						= "run",
	[ACT_MP_CROUCH_IDLE] 				= "subtle_motion",
	[ACT_MP_CROUCHWALK] 				= "crawl_on_belly",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= "itch",
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= "itch",
	[ACT_MP_RELOAD_STAND] 				= "itch",
	[ACT_MP_RELOAD_CROUCH] 				= "itch",
	[ACT_MP_JUMP] 						= "run",
	[ACT_MP_SWIM_IDLE] 					= "walk",
	[ACT_MP_SWIM] 						= "walk",
	[ACT_LAND] 							= "walk"
})

GM:AddAnimTable({
	"models/aliens/shieldbug/shieldbug.mdl"
}, {
	[ACT_MP_STAND_IDLE] 				= "idle_open",
	[ACT_MP_WALK] 						= "run_all",
	[ACT_MP_RUN] 						= "run_all",
	[ACT_MP_CROUCH_IDLE] 				= "idle_open",
	[ACT_MP_CROUCHWALK] 				= "run_all",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_MELEE_ATTACK1,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_MELEE_ATTACK2,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
}, {
	[ACT_MP_STAND_IDLE] 				= "idle_defend",
	[ACT_MP_WALK] 						= "run_all_defend",
	[ACT_MP_RUN] 						= "run_all_defend",
	[ACT_MP_CROUCH_IDLE] 				= "idle_defend",
	[ACT_MP_CROUCHWALK] 				= "run_all_defend",
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE] 	= ACT_MELEE_ATTACK1,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE] 	= ACT_MELEE_ATTACK2,
	[ACT_MP_RELOAD_STAND] 				= ACT_IDLE,
	[ACT_MP_RELOAD_CROUCH] 				= ACT_IDLE,
	[ACT_MP_JUMP] 						= ACT_RUN,
	[ACT_MP_SWIM_IDLE] 					= ACT_IDLE,
	[ACT_MP_SWIM] 						= ACT_IDLE,
	[ACT_LAND] 							= ACT_IDLE
})

function GM:UseUnholsteredAnims(tab, wep)
	return tab["_UNHOLSTERED"] and IsValid(wep) and (not wep.ShouldLower or not wep:ShouldLower())
end

function GM:CalcMainActivity(ply, vel)
	ply.CalcIdeal = ACT_MP_STAND_IDLE
	ply.CalcSeqOverride = -1

	self:HandlePlayerLanding(ply, vel, ply.m_bWasOnGround)

	if self:HandlePlayerNoClipping(ply, vel) or
		self:HandlePlayerDriving(ply) or
		self:HandlePlayerVaulting(ply, vel) or
		self:HandlePlayerJumping(ply, vel) or
		self:HandlePlayerDucking(ply, vel) or
		self:HandlePlayerSwimming(ply, vel) then
	else
		local len2d = vel:Length2D()

		if len2d > ply:GetRunSpeed() / math.sqrt(2) - 8 then
			ply.CalcIdeal = ACT_MP_RUN
		elseif len2d > 0.5 then
			ply.CalcIdeal = ACT_MP_WALK
		end
	end

	ply.m_bWasOnGround = ply:IsOnGround()
	ply.m_bWasNoclipping = ply:GetMoveType() == MOVETYPE_NOCLIP and not ply:InVehicle()

	self:HandlePlayerNonPlayermodel(ply, vel)

	local wep = ply:GetActiveWeapon()

	if IsValid(wep) and wep.CalcMainActivity then
		wep:CalcMainActivity(ply, vel)
	end

	return ply.CalcIdeal, ply.CalcSeqOverride
end

function GM:HandlePlayerNonPlayermodel(ply, vel)
	local tab = self.AnimTable[string.lower(ply:GetModel())]

	if not tab then
		return
	end

	if self:UseUnholsteredAnims(tab, ply:GetActiveWeapon()) then
		tab = tab["_UNHOLSTERED"]
	end

	if tab[ply.CalcIdeal] then
		if type(tab[ply.CalcIdeal]) == "number" then
			ply.CalcIdeal = tab[ply.CalcIdeal]
		else
			ply.CalcSeqOverride = ply:LookupSequence(tab[ply.CalcIdeal])
		end
	end
end

function GM:UpdateAnimation(ply, vel, max)
	if CLIENT then
		max = max * ply:Scale()
	end

	self.BaseClass:UpdateAnimation(ply, vel, max)

	if CLIENT then
		if self.AnimTable[string.lower(ply:GetModel())] then
			ply:SetIK(false)
		else
			ply:SetIK(true)
		end

		if string.lower(ply:GetModel()) == "models/combine_scanner.mdl" then
			if math.abs(ply:GetVelocity().z) > 0 then
				ply:SetPoseParameter("tail_control", ply:GetVelocity().z / 2)
			end

			ply:SetPoseParameter("flex_vert", ply:EyeAngles().x / 4.5)
			ply:SetPoseParameter("dynamo_wheel", CurTime() * 120)
		end

		if string.lower(ply:GetModel()) == "models/aliens/shieldbug/shieldbug.mdl" then
			ply:SetPoseParameter("aim_pitch", 0)
			ply:SetPoseParameter("aim_yaw", 0)
		end

		local moveang = Vector(vel.x, vel.y, 0):Angle()
		local eyeang = Vector(ply:GetAimVector().x, ply:GetAimVector().y, 0):Angle()

		local diff = moveang.y - eyeang.y

		if diff > 180 then diff = diff - 360 end
		if diff < -180 then diff = diff + 360 end

		ply:SetPoseParameter("move_yaw", diff)

		self:RadioAnimation(ply)
	end
end

function GM:RadioAnimation(ply)
	ply.RadioWeight = ply.RadioWeight or 0

	if ply:Typing() == CHATINDICATOR_RADIOING then
		ply.RadioWeight = math.Approach(ply.RadioWeight, 1, FrameTime() * 5.0)
	else
		ply.RadioWeight = math.Approach(ply.RadioWeight, 0, FrameTime() * 5.0)
	end

	if ply.RadioWeight > 0 then
		ply:AnimRestartGesture(GESTURE_SLOT_VCD, ACT_GMOD_IN_CHAT, true)
		ply:AnimSetGestureWeight(GESTURE_SLOT_VCD, ply.RadioWeight)
	end
end

function GM:DoAnimationEvent(ply, event, data)
	local tab = self.AnimTable[string.lower(ply:GetModel())]

	if tab then
		if self:UseUnholsteredAnims(tab, ply:GetActiveWeapon()) then
			tab = tab["_UNHOLSTERED"]
		end

		if event == PLAYERANIMEVENT_ATTACK_PRIMARY then
			local act = ply:Crouching() and ACT_MP_ATTACK_CROUCH_PRIMARYFIRE or ACT_MP_ATTACK_STAND_PRIMARYFIRE

			ply:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ply:LookupSequence(tab[act]), 0, true)
		elseif event == PLAYERANIMEVENT_RELOAD then
			local act = ply:Crouching() and ACT_MP_RELOAD_CROUCH or ACT_MP_RELOAD_STAND

			ply:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ply:LookupSequence(tab[act]), 0, true)
		end
	end

	return self.BaseClass:DoAnimationEvent(ply, event, data)
end

function GM:DoGestureEvent(ply, gesture)
	ply:AddVCDSequenceToGestureSlot(GESTURE_SLOT_CUSTOM, ply:LookupSequence(gesture), 0, true)
end

if CLIENT then
	netstream.Hook("PlayGesture", function(data)
		local gesture = data.Gesture
		local player = data.Player

		if gesture and IsValid(player) and player:IsPlayer() then
			GAMEMODE:DoGestureEvent(player, gesture)
		end
	end)
end
