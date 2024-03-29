AddCSLuaFile()

SWEP.PrintName 				= "Zone Marker"
SWEP.Author 				= "TankNut"

SWEP.RenderGroup 			= RENDERGROUP_TRANSLUCENT

SWEP.Slot 					= 5
SWEP.SlotPos 				= 10

SWEP.Primary.ClipSize 		= -1
SWEP.Primary.DefaultClip 	= -1
SWEP.Primary.Automatic 		= false
SWEP.Primary.Ammo 			= "none"

SWEP.Secondary.ClipSize 	= -1
SWEP.Secondary.DefaultClip 	= -1
SWEP.Secondary.Automatic 	= false
SWEP.Secondary.Ammo 		= "none"

SWEP.ViewModel 				= Model("models/weapons/c_arms.mdl")
SWEP.WorldModel 			= ""

function SWEP:Deploy()
	self:SetHoldType("Normal")
end

function SWEP:PrimaryAttack()
	if CLIENT then
		return
	end

	local ply = self.Owner
	local pos = ply:EyePos()

	local mins = ply:ZoneMins()
	local maxs = ply:ZoneMaxs()

	if util.IsInWorld(pos) then
		local tr = ply:GetEyeTrace()

		pos = tr.HitPos

		if ply:KeyDown(IN_USE) and mins and maxs then
			local vec = ply:GetAimVector()
			local key, val = 0, 0

			local tab = {
				Vector(1, 0, 0),
				Vector(0, 1, 0),
				Vector(0, 0, 1)
			}

			for k, v in pairs(tab) do
				local dist = math.abs(vec:Dot(v))

				if dist > val then
					key = k
					val = dist
				end
			end

			local dir = tab[key]
			local center = LerpVector(0.5, mins, maxs)
			local diff = (pos - center) * dir

			pos = center + diff
		end
	end

	if not mins and not maxs then
		mins = Vector(pos)
		maxs = Vector(pos)
	end

	mins.x = math.min(mins.x, pos.x)
	mins.y = math.min(mins.y, pos.y)
	mins.z = math.min(mins.z, pos.z)

	maxs.x = math.max(maxs.x, pos.x)
	maxs.y = math.max(maxs.y, pos.y)
	maxs.z = math.max(maxs.z, pos.z)

	ply:SetZoneMins(mins)
	ply:SetZoneMaxs(maxs)
end

function SWEP:SecondaryAttack()
	if CLIENT then
		return
	end

	local ply = self.Owner

	ply:SetZoneMins(false)
	ply:SetZoneMaxs(false)
end

hook.Add("PostDrawTranslucentRenderables", "zonemarker.PostDrawTranslucentRenderables", function(depth, skybox)
	if skybox then
		return
	end

	local mins, maxs = LocalPlayer():ZoneMins(), LocalPlayer():ZoneMaxs()

	if not mins or not maxs then
		return
	end

	local center = LerpVector(0.5, mins, maxs)

	mins = mins - center
	maxs = maxs - center

	local color = Color(0, 127, 31, 50)

	render.SetColorMaterial()
	render.DrawBox(center, Angle(), mins, maxs, color)
	render.DrawWireframeBox(center, Angle(), mins, maxs, color)
end)
