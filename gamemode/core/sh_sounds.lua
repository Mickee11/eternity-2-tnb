local fireSounds = {
	level = 97,
	volume = 1,
	pitch = {92, 112}
}

local function directional(snd)
	if istable(snd) then
		for k, v in pairs(snd) do
			snd[k] = ")" .. v
		end
	else
		snd = ")" .. snd
	end

	return snd
end

function GM:AddSound(partial, options)
	local tab = table.Copy(partial)

	table.Merge(tab, options)
	sound.Add(tab)

	if istable(tab.sound) then
		for _, v in pairs(tab.sound) do
			util.PrecacheSound(v)
		end
	else
		util.PrecacheSound(tab.sound)
	end
end

function GM:AddFireSound(name, snd, level, pitch)
	self:AddWeaponSound(name, snd, level, CHAN_WEAPON, pitch)
end

function GM:AddWeaponSound(name, snd, level, chan, pitch)
	snd = directional(snd)

	local tab = {
		name = name,
		channel = chan or CHAN_AUTO,
		level = level,
		sound = snd,
		pitch = pitch
	}

	self:AddSound(fireSounds, tab)
end

GM:AddFireSound("eternity.bullet_impact", {
	"eternity/impact/gun_impact_1.wav",
	"eternity/impact/gun_impact_2.wav",
	"eternity/impact/gun_impact_3.wav",
	"eternity/impact/gun_impact_4.wav",
	"eternity/impact/gun_impact_5.wav",
	"eternity/impact/gun_impact_6.wav",
	"eternity/impact/gun_impact_7.wav",
	"eternity/impact/gun_impact_8.wav",
	"eternity/impact/gun_impact_9.wav",
	"eternity/impact/gun_impact_10.wav",
	"eternity/impact/gun_impact_11.wav",
	"eternity/impact/gun_impact_12.wav",
	"eternity/impact/gun_impact_13.wav",
	"eternity/impact/gun_impact_14.wav"
}, 75)
GM:AddFireSound("eternity.switch_firemode", "tnb/weapons/common/effects/firemode_switch.wav", 75)
GM:AddFireSound("eternity.dry_pistol", "tnb/weapons/common/effects/dry_pistol.wav", 75)
GM:AddFireSound("eternity.dry_rifle", "tnb/weapons/common/effects/dry_rifle.wav", 75)
GM:AddFireSound("eternity.knife_slash", {
	"weapons/knife/knife_slash1.wav",
	"weapons/knife/knife_slash2.wav",
}, 75)
GM:AddFireSound("eternity.knife_hit", {
	"weapons/knife/knife_hit1.wav",
	"weapons/knife/knife_hit2.wav",
	"weapons/knife/knife_hit3.wav",
	"weapons/knife/knife_hit4.wav"
}, 75)
GM:AddFireSound("eternity.weapon_m16a2", "tnb/weapons/common/firearms/m16a2/fire1.wav", 140, 80)
GM:AddFireSound("eternity.weapon_m16a2.sd", "tnb/weapons/common/firearms/m16a2/sp_fire1.wav", 75, 180)
GM:AddFireSound("eternity.weapon_galil", "tnb/weapons/common/firearms/galil/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_galil.sd", "tnb/weapons/common/firearms/galil/fire1.wav", 75, 180)
GM:AddFireSound("eternity.weapon_aug", "tnb/weapons/common/firearms/aug/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_m249", "tnb/weapons/common/firearms/m249/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_akm", "tnb/weapons/common/firearms/akm/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_akm.sd", "tnb/weapons/common/firearms/akm/fire1.wav", 140, 180)
GM:AddFireSound("eternity.weapon_ak107", "tnb/weapons/common/firearms/ak107/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_ak107.sd", "tnb/weapons/common/firearms/ak107/fire1.wav", 75, 255)
GM:AddFireSound("eternity.weapon_aek", "tnb/weapons/common/firearms/aek971/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_aek.sd", "tnb/weapons/common/firearms/aek971/fire1.wav", 75, 255)
GM:AddFireSound("eternity.weapon_sks", "tnb/weapons/common/firearms/sks/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_rpk", "tnb/weapons/common/firearms/rpk/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_spas12", "tnb/weapons/common/firearms/spas12/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_winchester", "tnb/weapons/common/firearms/winchester24/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_ithaca", "tnb/weapons/common/firearms/ithaca/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_mossberg", "tnb/weapons/common/firearms/mossberg/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_m1014", "tnb/weapons/common/firearms/m1014/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_uzi", "tnb/weapons/common/firearms/uzi/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_uzi.sd", "tnb/weapons/common/firearms/uzi/fire1.wav", 75, 140)
GM:AddFireSound("eternity.weapon_mp5", {
	"tnb/weapons/common/firearms/mp5/fire1.wav",
	"tnb/weapons/common/firearms/mp5/fire2.wav",
	"tnb/weapons/common/firearms/mp5/fire3.wav",
	"tnb/weapons/common/firearms/mp5/fire4.wav"
}, 140)
GM:AddFireSound("eternity.weapon_mp5.sd", {
	"tnb/weapons/common/firearms/mp5/sp_fire1.wav",
	"tnb/weapons/common/firearms/mp5/sp_fire2.wav",
	"tnb/weapons/common/firearms/mp5/sp_fire3.wav",
	"tnb/weapons/common/firearms/mp5/sp_fire4.wav"
}, 75, 130)
GM:AddFireSound("eternity.weapon_mp5.k", "tnb/weapons/common/firearms/mp5/snap1.wav", 140, 140)
GM:AddFireSound("eternity.weapon_mp7", "tnb/weapons/common/firearms/mp7/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_mp7.sd", "tnb/weapons/common/firearms/mp7/sp_fire1.wav", 75, nil)
GM:AddFireSound("eternity.weapon_mac10", {
	"tnb/weapons/common/firearms/mac10/fire1.wav",
	"tnb/weapons/common/firearms/mac10/fire2.wav",
	"tnb/weapons/common/firearms/mac10/fire3.wav"
}, 140)
GM:AddFireSound("eternity.weapon_mac10.sd", {
	"tnb/weapons/common/firearms/mac10/fire1.wav",
	"tnb/weapons/common/firearms/mac10/fire2.wav",
	"tnb/weapons/common/firearms/mac10/fire3.wav"
}, 75, 160)
GM:AddFireSound("eternity.weapon_supershorty", "tnb/weapons/common/firearms/supershorty/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_striker", "tnb/weapons/common/firearms/striker/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_tec9", "tnb/weapons/common/firearms/tec9/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_tec9.sd", "tnb/weapons/common/firearms/tec9/fire1.wav", 75, 175)
GM:AddFireSound("eternity.weapon_glock", {
	"tnb/weapons/common/firearms/glock/fire1.wav",
	"tnb/weapons/common/firearms/glock/fire2.wav",
	"tnb/weapons/common/firearms/glock/fire3.wav"
}, 140)
GM:AddFireSound("eternity.weapon_glock.sd", "tnb/weapons/common/firearms/glock/sp_fire1.wav", 75, 130)
GM:AddFireSound("eternity.weapon_p99", {
	"tnb/weapons/common/firearms/p99/fire1.wav",
	"tnb/weapons/common/firearms/p99/fire2.wav"
}, 140)
GM:AddFireSound("eternity.weapon_p99.sd", {
	"tnb/weapons/common/firearms/p99/fire1.wav",
	"tnb/weapons/common/firearms/p99/fire2.wav"
}, 75, 150)
GM:AddFireSound("eternity.weapon_hardballer", {
	"tnb/weapons/common/firearms/hardballer/fire1.wav",
	"tnb/weapons/common/firearms/hardballer/fire2.wav",
	"tnb/weapons/common/firearms/hardballer/fire3.wav",
	"tnb/weapons/common/firearms/hardballer/fire4.wav"
}, 140)
GM:AddFireSound("eternity.weapon_usp", "tnb/weapons/common/firearms/usp/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_usp.sd", "tnb/weapons/common/firearms/usp/sp_fire1.wav", 75)
GM:AddFireSound("eternity.weapon_m1911", {
	"tnb/weapons/common/firearms/m1911/fire1.wav",
	"tnb/weapons/common/firearms/m1911/fire2.wav",
	"tnb/weapons/common/firearms/m1911/fire3.wav",
	"tnb/weapons/common/firearms/m1911/fire4.wav"
}, 140)
GM:AddFireSound("eternity.weapon_m1911.sd", {
	"tnb/weapons/common/firearms/m1911/fire1.wav",
	"tnb/weapons/common/firearms/m1911/fire2.wav",
	"tnb/weapons/common/firearms/m1911/fire3.wav",
	"tnb/weapons/common/firearms/m1911/fire4.wav"
}, 75, 210)
GM:AddFireSound("eternity.weapon_kingcobra", "tnb/weapons/common/firearms/kingcobra/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_taurus605", "tnb/weapons/common/firearms/kingcobra/fire1_legacy.wav", 140)
GM:AddFireSound("eternity.weapon_enfield", "tnb/weapons/common/firearms/enfield/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_bren", "tnb/weapons/common/firearms/bren/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_g36c", "tnb/weapons/common/firearms/g36c/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_g36c.sd", "tnb/weapons/common/firearms/g36c/fire1.wav", 75, 180)
GM:AddFireSound("eternity.weapon_m24", "tnb/weapons/common/firearms/m24/fire1.wav", 140)
GM:AddFireSound("eternity.weapon_m24.sd", "tnb/weapons/common/firearms/m24/fire1.wav", 75, 180)
GM:AddFireSound("eternity.weapon_scar", "tekka/weapons/weapon_m1.wav", 140)
GM:AddFireSound("eternity.weapon_scar.sd", "tekka/weapons/weapon_silencedsocom.wav", 75, 180)

if CLIENT then
	netstream.Hook("DistantExplosion", function(data)
		local pos = data.Pos
		local typeid = data.Type

		local fadenear, fadefar
		local nearsnd, farsnd

		if typeid == EXPLOSION_SPNKR then
			fadenear = 10000
			fadefar = 20000

			nearsnd = string.format("vuthakral/halo/weapons/spnkr/explode%s.wav", math.random(0, 5))
			farsnd = string.format("vuthakral/halo/weapons/spnkr/explode_dist%s.wav", math.random(0, 2))
		elseif typeid == EXPLOSION_40MM then
			fadenear = 8000

			nearsnd = string.format("vuthakral/halo/weapons/m139/explode%s.wav", math.random(0, 2))
		else
			return
		end

		local dist = LocalPlayer():EyePos():Distance(pos)

		if nearsnd and dist < fadenear then
			local vol = math.ClampedRemap(dist, 0, fadenear, 1, 0)

			LocalPlayer():EmitSound(nearsnd, 100, 100, vol)
		end

		if farsnd and dist < fadefar then
			local vol = math.ClampedRemap(dist, 0, fadefar, 1, 0)

			LocalPlayer():EmitSound(farsnd, 100, 100, vol)
		end
	end)
end
