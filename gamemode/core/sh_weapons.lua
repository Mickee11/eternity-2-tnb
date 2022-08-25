local meta = FindMetaTable("Player")

function meta:ToggleHolster()
	if self:ShouldLockInput() then
		return
	end

	local weapon = self:GetActiveWeapon()

	if IsValid(weapon) and weapon.ToggleHolster then
		weapon:ToggleHolster()
	end
end

function meta:HandleWeaponDraw(weapon)
	weapon = weapon or self:GetActiveWeapon()

if not IsValid(weapon) then
  	return
end

	weapon:SetNoDraw(self:GetNoDraw())
end

hook.Add("Think", "Weapons", function()
	for _, v in pairs(player.GetAll()) do
		v:HandleWeaponDraw()
	end
end)

if SERVER then
	netstream.Hook("ToggleHolster", function(ply, data)
		ply:ToggleHolster()
	end)

	netstream.Hook("ModifyWeaponItemVariant", function(ply, data)
		local item = GAMEMODE:GetItem(data.ID)

		if not item or not item.Weapon or not item:IsEquipped() or not item:CanInteract(ply) then
			return
		end

		local requested = data.Variant
		local selected = item.Selected

		if selected == nil then
			selected = "Default"
		end

		if requested == selected then
			ply:GiveItem("currency_gunparts", item.Proxy.Variants[requested].Refund)

			if selected == "Default" then
				GAMEMODE:WriteLog("item_destroy", {
					Ply = GAMEMODE:LogPlayer(ply),
					Char = GAMEMODE:LogCharacter(ply),
					Item = GAMEMODE:LogItem(item)
				})

				ply:VisibleMessage(string.format("%s deconstructs their %s.", ply:VisibleRPName(), string.lower(item:GetName())))

				GAMEMODE:DeleteItem(item)

				return
			end

			item:TakeWeapon(ply)
			item.Selected = "Default"
			item:GiveWeapon(ply)

			if item.Weapon ~= nil then
				ply:SelectWeapon(item.Variants[item.Selected].WeaponClass)
				ply:EmitSound("items/ammo_pickup.wav")
			end

			item.Width = item.Variants[item.Selected].Width
			item.Height = item.Variants[item.Selected].Height

			return
		end

		if selected == "Default" then
			if not ply:HasItem("currency_gunparts", item.Proxy.Variants[requested].Cost) then
				ply:SendChat("ERROR", "You do not have enough parts to ugprade this weapon.")

				return
			end

			local success = ply:TakeItem("currency_gunparts", item.Proxy.Variants[requested].Cost)

			if not success then
				return -- Just in case someone does some in less than zero milliseconds.
			end

			item:TakeWeapon(ply)
			item.Selected = requested
			item:GiveWeapon(ply)

			if item.Weapon ~= nil then
				ply:SelectWeapon(item.Variants[item.Selected].WeaponClass)
				ply:EmitSound("items/ammo_pickup.wav")
			end

			item.Width = item.Variants[item.Selected].Width
			item.Height = item.Variants[item.Selected].Height

			return
		end
	end)
end
