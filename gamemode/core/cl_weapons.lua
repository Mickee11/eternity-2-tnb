local holsterDown = false

local meta = FindMetaTable("Weapon")

function meta:IsEternity()
	if self.Base then
		return tobool(string.find(self.Base, "eternity"))
	end

	return false
end

local binds = {"invnext", "invprev", "jump"}

netstream.Hook("ImpactSound", function(data)
	if GAMEMODE:GetSetting("sounds_bullets") then
		sound.Play("eternity.bullet_impact", data.HitPos, 120, 100, 1)
	end
end)

hook.Add("PlayerBindPress", "CL.Weapon.PlayerBindPress", function(ply, bind, down)
	if not down then
		return
	end

	local weapon = ply:GetActiveWeapon()

	if IsValid(weapon) and weapon:IsEternity() and weapon.AimingDownSights and weapon:AimingDownSights() then
		for _, v in pairs(binds) do
			if string.find(bind, v) then
				return true
			end
		end
	end
end)

hook.Add("PreDrawPlayerHands", "CL.Weapon.PreDrawPlayerHands", function(_, _, _, weapon)
	return weapon:IsEternity()
end)

hook.Add("Think", "weapons.Think", function()
	for _, v in pairs(player.GetAll()) do
		if v == LocalPlayer() then
			continue
		end

		local weapon = v:GetActiveWeapon()

		if IsValid(weapon) and weapon:IsEternity() then
			weapon:Think()
		end
	end

	local weapon = LocalPlayer():GetActiveWeapon()
	local vm = LocalPlayer():GetViewModel()

	if not IsValid(weapon) then
		return
	end

	if IsValid(vm) then
		if weapon.Base and string.find(weapon.Base, "eternity") then
			vm:SetMaterial("null")
		else
			vm:SetMaterial()
		end
	end

	if LocalPlayer():IsInCamera() then
		return
	end

	if vgui.CursorVisible() then
		holsterDown = false
	else
		if input.IsKeyDown(KEY_B) and not holsterDown then
			holsterDown = true

			netstream.Send("ToggleHolster")
			LocalPlayer():ToggleHolster()
		elseif not input.IsKeyDown(KEY_B) and holsterDown then
			holsterDown = false
		end
	end
end)
