AddCSLuaFile()

SWEP.Base 				= "eternity_firearm_base"

SWEP.PrintName 			= "Overwatch Compact PDW"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_ar1.mdl")
SWEP.VMBodyGroups		= {[1] = 0}

SWEP.WorldModel 		= Model("models/tnb/weapons/w_ar1.mdl")
SWEP.WMBodyGroups		= {[1] = 0}

SWEP.HoldType 			= "ar2"
SWEP.HoldTypeLowered 	= "passive"

SWEP.Firemodes 			= {
	{Mode = "firemode_auto"}
}

SWEP.Animated 			= true
SWEP.AnimatedADS 		= true

SWEP.ClipSize 			= 20
SWEP.Delay 				= 0.1

SWEP.HipCone 			= 0.03 -- Hipfire spread 
SWEP.AimCone 			= 0.01 -- ADS spread

SWEP.Recoil 			= 0.75

SWEP.FireSound 			= Sound("eternity.weapon_pulse_pdw")
SWEP.DrySound			= Sound("eternity.dry_pulse")

SWEP.RecoilMult 		= 0

SWEP.AimOffset = {
	ang = Angle(-1, 0, 0),
	pos = Vector(-6.1825, -10, 0.28)
}

SWEP.Animations = {
	fire = {"fire01"},
	fire_last = "fire01",
	reload = "reload",
	reload_empty = "reload",
	draw = "draw"
}

function SWEP:FireAnimationEvent(pos, ang, event, options)
	if event == 6001 then return true end
	if event == 5001 then return true end
	if event == 20 then return true end
	if event == 21 then return true end
end

if CLIENT then
	local mat = CreateMaterial("cloak_override", "VertexLitGeneric", {
		["$basetexture"] = "null",
		["$translucent"] = "1",
		["$nocull"] = "1",
		["$cloakpassenabled"] = "1",
		["$refactamount"] = "1",
		["proxies"] = {
			["PlayerCloak"] = {
				["resultVar"] = "$cloakfactor"
			},
			["Clamp"] = {
				["min"] = 0,
				["max"] = 1,
				["srcVar1"] = "$cloakfactor",
				["resultVar"] = "$cloakfactor"
			}
		}
	})

	function SWEP:DrawWorldModelTranslucent()
		local ply = self:GetOwner()

		self:DrawModel()

		if IsValid(ply) and GAMEMODE:GetCloakVal(ply) > 0 then
			render.MaterialOverride(mat)
		end

		self:DrawModel()

		render.MaterialOverride()
	end
end
