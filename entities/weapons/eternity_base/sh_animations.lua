SWEP.CurrentSSTable = {}
SWEP.CurrentSSEntry = 0
SWEP.SSTime = 0
SWEP.SSSpeed = 1

function SWEP:PlayAnimation(anim, speed, cycle, nosound, ent, force)
	speed = speed or 1
	cycle = cycle or 0
	ent = ent or self.VM

	if CLIENT and not IsValid(ent) then
		return 0
	end

	if speed < 0 then
		cycle = 1 - cycle
	end

	if not anim then
		return 0
	end

	if ent == self.VM then
		anim = self.Animations[anim] or anim

		if istable(anim) then
			anim = table.Random(anim)
		elseif isfunction(anim) then
			anim = anim(self)
		end

		if IsFirstTimePredicted() or force then
			local snd = self.SoundScripts[anim]

			if snd and not nosound then
				self:SetupSoundScript(snd, speed, cycle)
			else
				self:StopSoundScript()
			end
		end

		if SERVER then
			local _, duration = self.Owner:GetViewModel():LookupSequence(anim)

			return math.abs((duration * (1 / speed)) - math.max(duration * (1 / speed) * cycle, 0))
		end
	end

	if IsFirstTimePredicted() or force then
		ent:ResetSequence(anim)
		ent:SetCycle(math.max(0, cycle))
		ent:SetPlaybackRate(speed)
	end

	local _, duration = ent:LookupSequence(anim)

	return math.abs((duration * (1 / speed)) - math.max(duration * (1 / speed) * cycle, 0))
end

function SWEP:SoundThink()
	if #self.CurrentSSTable > 0 then
		local entry = self.CurrentSSTable[self.CurrentSSEntry]

		if not entry then
			return
		end

		if CurTime() > self.SSTime + entry.time / self.SSSpeed then
			if entry.external or (CLIENT and LocalPlayer():GetViewEntity() == self.Owner) then
				self:EmitSound(entry.snd)
			end

			if entry.callback then
				entry.callback(self)
			end

			self.CurrentSSEntry = self.CurrentSSEntry + 1

			if not self.CurrentSSTable[self.CurrentSSEntry] then
				self:StopSoundScript()
			end
		end
	end
end

function SWEP:SetupSoundScript(tab, speed, cycle)
	local index = 1
	local valid = false

	if cycle != 0 then
		local length = self.VM:SequenceDuration()
		local time = length * cycle

		for k, v in pairs(tab) do
			if time < v.time then
				index = k
				valid = true

				break
			end
		end
	else
		valid = true
	end

	if valid then
		self.CurrentSSTable = tab
		self.CurrentSSEntry = index
		self.SSTime = CLIENT and UnPredictedCurTime() or CurTime()
		self.SSSpeed = speed
	else
		self:StopSoundScript()
	end
end

function SWEP:StopSoundScript()
	self.CurrentSSTable = {}
	self.CurrentSSEntry = 0
	self.SSTime = 0
end

local baseHoldTypes = {
	["pistol"]		= ACT_HL2MP_IDLE_PISTOL,
	["smg"]			= ACT_HL2MP_IDLE_SMG1,
	["grenade"]		= ACT_HL2MP_IDLE_GRENADE,
	["ar2"]			= ACT_HL2MP_IDLE_AR2,
	["shotgun"]		= ACT_HL2MP_IDLE_SHOTGUN,
	["rpg"]			= ACT_HL2MP_IDLE_RPG,
	["physgun"]		= ACT_HL2MP_IDLE_PHYSGUN,
	["crossbow"]	= ACT_HL2MP_IDLE_CROSSBOW,
	["melee"]		= ACT_HL2MP_IDLE_MELEE,
	["slam"]		= ACT_HL2MP_IDLE_SLAM,
	["normal"]		= ACT_HL2MP_IDLE,
	["fist"]		= ACT_HL2MP_IDLE_FIST,
	["melee2"]		= ACT_HL2MP_IDLE_MELEE2,
	["passive"]		= ACT_HL2MP_IDLE_PASSIVE,
	["knife"]		= ACT_HL2MP_IDLE_KNIFE,
	["duel"]		= ACT_HL2MP_IDLE_DUEL,
	["camera"]		= ACT_HL2MP_IDLE_CAMERA,
	["magic"]		= ACT_HL2MP_IDLE_MAGIC,
	["revolver"]	= ACT_HL2MP_IDLE_REVOLVER
}

local holdTypes = {}

for k, v in pairs(baseHoldTypes) do
	holdTypes[k] = {
		[ACT_MP_STAND_IDLE]					= v,
		[ACT_MP_WALK]						= v + 1,
		[ACT_MP_RUN]						= v + 2,
		[ACT_MP_CROUCH_IDLE]				= v + 3,
		[ACT_MP_CROUCHWALK]					= v + 4,
		[ACT_MP_ATTACK_STAND_PRIMARYFIRE]	= v + 5,
		[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= v + 5,
		[ACT_MP_RELOAD_STAND]				= v + 6,
		[ACT_MP_RELOAD_CROUCH]				= v + 6,
		[ACT_MP_JUMP]						= v + 7,
		[ACT_RANGE_ATTACK1]					= v + 8,
		[ACT_MP_SWIM]						= v + 9
	}
end

holdTypes.normal[ACT_MP_JUMP] = ACT_HL2MP_JUMP_SLAM

holdTypes.passive[ACT_MP_CROUCH_IDLE] = ACT_HL2MP_IDLE_CROUCH
holdTypes.passive[ACT_MP_CROUCHWALK] = ACT_HL2MP_WALK_CROUCH

holdTypes.slam[ACT_MP_ATTACK_STAND_PRIMARYFIRE] = ACT_INVALID

holdTypes.revolver[ACT_MP_CROUCH_IDLE] = ACT_HL2MP_IDLE_CROUCH_PISTOL

holdTypes.pistol[ACT_MP_STAND_IDLE] = ACT_HL2MP_IDLE_REVOLVER
holdTypes.pistol[ACT_MP_WALK] = ACT_HL2MP_WALK_REVOLVER

holdTypes.ratel = {
	[ACT_MP_STAND_IDLE]					= ACT_HL2MP_IDLE_RPG,
	[ACT_MP_WALK]						= ACT_HL2MP_WALK_RPG,
	[ACT_MP_RUN]						= ACT_HL2MP_RUN_RPG,
	[ACT_MP_CROUCH_IDLE]				= ACT_HL2MP_IDLE_CROUCH_AR2,
	[ACT_MP_CROUCHWALK]					= ACT_HL2MP_WALK_CROUCH_AR2,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE]	= ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= ACT_HL2MP_GESTURE_RANGE_ATTACK_REVOLVER,
	[ACT_MP_RELOAD_STAND]				= ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
	[ACT_MP_RELOAD_CROUCH]				= ACT_HL2MP_GESTURE_RELOAD_REVOLVER,
	[ACT_MP_JUMP]						= ACT_HL2MP_JUMP_RPG,
	[ACT_RANGE_ATTACK1]					= ACT_HL2MP_SWIM_IDLE_RPG,
	[ACT_MP_SWIM]						= ACT_HL2MP_SWIM_RPG
}

holdTypes.sniper = {
	[ACT_MP_STAND_IDLE]					= ACT_HL2MP_IDLE_RPG,
	[ACT_MP_WALK]						= ACT_HL2MP_WALK_RPG,
	[ACT_MP_RUN]						= ACT_HL2MP_RUN_RPG,
	[ACT_MP_CROUCH_IDLE]				= ACT_HL2MP_IDLE_CROUCH_AR2,
	[ACT_MP_CROUCHWALK]					= ACT_HL2MP_WALK_CROUCH_AR2,
	[ACT_MP_ATTACK_STAND_PRIMARYFIRE]	= ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,
	[ACT_MP_ATTACK_CROUCH_PRIMARYFIRE]	= ACT_HL2MP_GESTURE_RANGE_ATTACK_CROSSBOW,
	[ACT_MP_RELOAD_STAND]				= ACT_HL2MP_GESTURE_RELOAD_AR2,
	[ACT_MP_RELOAD_CROUCH]				= ACT_HL2MP_GESTURE_RELOAD_AR2,
	[ACT_MP_JUMP]						= ACT_HL2MP_JUMP_AR2,
	[ACT_RANGE_ATTACK1]					= ACT_HL2MP_SWIM_IDLE_AR2,
	[ACT_MP_SWIM]						= ACT_HL2MP_SWIM_AR2
}

function SWEP:SetWeaponHoldType(set)
	self.ActivityTranslate = holdTypes[set] or holdTypes.normal
end

function SWEP:TranslateActivity(act)
	return self.ActivityTranslate[act] or -1
end
