function ITEM:CreateOptions(ply)
	if not self:CanInteract(ply) then
		return
	end

	local popup = EternityDermaMenu()

	for _, v in pairs(self:GetOptions(ply)) do
		popup:AddOption(v.Name, function()
			if v.Client then
				coroutine.WrapFunc(function()
					if not v.Callback then
						v.Client()

						return
					end

					netstream.Send("RunItemFunction", {
						ID = self.NetworkID,
						Name = v.Name,
						Value = v.Client()
					})
				end)
			else
				netstream.Send("RunItemFunction", {
					ID = self.NetworkID,
					Name = v.Name
				})
			end
		end)
	end

	popup:Open()
end

function ITEM:GetOptions(ply)
	local tab = {}

	if table.Count(self.Inventories) > 0 and self:CanInteractWithChild(ply) then
		table.insert(tab, {
			Name = "Open Inventory",
			Client = function()
				GAMEMODE:OpenGUI("InventoryPopup", self:GetName(), self.Inventories)
			end
		})
	end

	if self.Width != self.Height and not self:GetInventory().EquipmentSlot then
		table.insert(tab, {
			Name = "Flip",
			Callback = function()
				local inventory = self:GetInventory()
				local x, y = inventory:GetOrigin(self)
				local w, h = self:GetSize()

				if not inventory:CanFit(x, y, h, w, {[self.NetworkID] = true}) then
					return
				end

				inventory:RemoveItem(self)

				self.Flipped = not self.Flipped

				inventory:AddItem(self, x, y)
			end
		})
	end

	if ply:CanSellItem(self) then
		local money = self.SellPrice

		if self:IsTypeOf("base_stacking") then
			money = math.floor(self.Stack * money)
		end

		table.insert(tab, {
			Name = string.format("Sell (%s Credits)", money),
			Callback = function()
				GAMEMODE:WriteLog("item_sold", {
					Ply = GAMEMODE:LogPlayer(ply),
					Char = GAMEMODE:LogCharacter(ply),
					Item = GAMEMODE:LogItem(self),
					Price = money
				})

				ply:VisibleMessage(string.format("%s sells their %s", ply:VisibleRPName(), string.lower(self:GetName())))

				GAMEMODE:DeleteItem(self)

				ply:GiveMoney(money)
			end
		})
	end


	if self:CanCustomDescribe() then
		table.insert(tab, {
			Name = "Custom Description",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "string", "Set Custom Description", {
					Default = self.CustomDescription,
					Multiline = true,
					Max = GAMEMODE:GetConfig("MaxItemDescLength")
				})
			end,
			Callback = function(val)
				if not GAMEMODE:CheckInput("string", {
					Max = GAMEMODE:GetConfig("MaxItemDescLength")
				}, val) then
					return
				end

				if not self:CanCustomDescribe() then
					return
				end

				self.CustomDescription = val
			end
		})
	end

	if self:CanDrop(ply) then
		table.insert(tab, {
			Name = "Drop Item",
			Callback = function()
				local inventory = self:GetInventory()

				inventory:RemoveItem(self)

				GAMEMODE:WriteLog("item_drop", {
					Ply = GAMEMODE:LogPlayer(ply),
					Char = GAMEMODE:LogCharacter(ply),
					Item = GAMEMODE:LogItem(self)
				})

				local item = self:SetWorldItem(ply:GetItemDropLocation(), Angle())

				if item ~= nil then
					item.DropID = ply:SteamID()
					item.DropCharacter = ply:CharID()
				else
					ply:SendChat("ERROR", "That custom item has an invalid physics model!")
				end
			end
		})
	end

	if self:CanDestroy(ply) then
		table.insert(tab, {
			Name = "Destroy Item",
			Client = function()
				return GAMEMODE:OpenGUI("Input", "confirm", "Item Confirmation", {
					ButtonText = string.format("Destroy %s", self:GetName())
				})
			end,
			Callback = function(val)
				if not val then
					return
				end

				GAMEMODE:WriteLog("item_destroy", {
					Ply = GAMEMODE:LogPlayer(ply),
					Char = GAMEMODE:LogCharacter(ply),
					Item = GAMEMODE:LogItem(self)
				})

				ply:VisibleMessage(string.format("%s destroys their %s", ply:VisibleRPName(), string.lower(self:GetName())))

				GAMEMODE:DeleteItem(self)
			end
		})
	end

	if ply:IsAdmin() then
		table.insert(tab, {
			Name = "Admin: Get Item ID",
			Callback = function()
				ply:SendChat("NOTICE", "The creation index of that item is: " .. self.NetworkID)
			end
		})
	end

	return tab
end

function ITEM:GetContextOptions(ply)
	return {}
end

if SERVER then
	netstream.Hook("RunItemFunction", function(ply, data)
		local item = GAMEMODE:GetItem(data.ID)
		local name = tostring(data.Name)
		local val = data.Value

		if not item or not item:CanInteract(ply) then
			return
		end

		for _, v in pairs(item:GetOptions(ply)) do
			if v.Name == tostring(name) then
				v.Callback(val)
			end
		end
	end)

	netstream.Hook("RunItemContext", function(ply, data)
		local item = GAMEMODE:GetItem(data.ID)
		local name = tostring(data.Name)
		local val = data.Value

		if not item or not item:IsEquipped() or not item:CanInteract(ply) then
			return
		end

		for _, v in pairs(item:GetContextOptions(ply)) do
			if v.Name == tostring(name) then
				v.Callback(val)
			end
		end
	end)
end