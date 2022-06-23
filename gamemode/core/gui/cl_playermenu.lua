local PANEL = {}

function PANEL:Init()
	self:SetSize(800, 500)

	self:SetToggleKey("gm_showspare1")
	self:SetAllowEscape(true)

	self:AddMenu("Character")
	self:AddMenu("Inventory")
	self:AddMenu("Business")

	if LocalPlayer():HasCombinePermission(COMBINE_SQUADHUD_JOINTEAM) or LocalPlayer():HasCombinePermission(COMBINE_SQUADHUD_CREATETEAM) then
		self:AddMenu("Patrol Teams")
	end

	self:AddMenu("Settings")

	self:SetupTopbar()

	self:MakePopup()
	self:Center()

	self.MenuItems[2]:DoClick()
end

function PANEL:UpdateCharacter()
	local colors = GAMEMODE:GetConfig("UIColors")
	local desc = LocalPlayer():VisibleDescription()

	desc = string.Escape(desc)

	local formatted = string.format("<font=eternity.labelsmall><col=%s>%s", util.ColorToChat(colors.TextNormal), desc)

	self.MarkLeft = markleft.Parse(formatted, self.Scroll:GetWide() - 15)

	if not IsValid(self.Description) then
		self.Description = self.Scroll:Add("eternity_panel")

		self.Description.Paint = function(pnl, w, h)
			self.MarkLeft:Draw(0, 0)
		end

		self.Scroll:AddItem(self.Description)
	end

	self.Description:SetSize(self.MarkLeft:GetSize())

	self.Scroll:InvalidateParent(true)
	self.Scroll:AutoSize()
	self.Scroll:UpdateLayout()
end

hook.Add("PlayerActiveDescriptionChanged", "playermenu.PlayerDescriptionChanged", function(ply, old, new)
	if ply != LocalPlayer() then
		return
	end

	local ui = GAMEMODE:GetGUI("PlayerMenu")

	if not IsValid(ui) or ui.Active != "Description" then
		return
	end

	ui:UpdateCharacter()
end)

hook.Add("PlayerRPNameChanged", "playermenu.PlayerRPNameChanged", function(ply, old, new)
	if ply != LocalPlayer() then
		return
	end

	local ui = GAMEMODE:GetGUI("PlayerMenu")

	if not IsValid(ui) or ui.Active != "Description" then
		return
	end

	if IsValid(ui.CharacterName) then
		ui.CharacterName:SetText(new)
	end
end)

function PANEL:CreateCharacter()
	self.Preview = self.Content:Add("eternity_playerview")
	self.Preview:DockMargin(0, 0, 20, 0)
	self.Preview:Dock(LEFT)
	self.Preview:SetWide(200)
	self.Preview:SetPlayer(LocalPlayer())
	self.Preview.TargetLookAt = Vector(0, 0, 54)

	self.CharacterName = self.Content:Add("eternity_label")
	self.CharacterName:DockMargin(0, 0, 0, 5)
	self.CharacterName:Dock(TOP)
	self.CharacterName:SetTall(22)
	self.CharacterName:SetFont("eternity.labelgiant")
	self.CharacterName:SetText(LocalPlayer():VisibleRPName())

	local bottom = self.Content:Add("eternity_panel")

	bottom:DockMargin(0, 5, 0, 0)
	bottom:Dock(BOTTOM)
	bottom:SetTall(22)

	self.DescEdit = bottom:Add("eternity_button")
	self.DescEdit:DockMargin(5, 0, 0, 0)
	self.DescEdit:Dock(RIGHT)
	self.DescEdit:SetWide(120)
	self.DescEdit:SetText("Edit Description")

	self.DescEdit.DoClick = function(pnl)
		coroutine.WrapFunc(function()
			local new = GAMEMODE:OpenGUI("Input", "string", "Edit Description", {
				Default = LocalPlayer():VisibleDescription(),
				Multiline = true,
				Max = 2048
			})

			netstream.Send("SetDescription", {
				Description = new,
				Old = LocalPlayer():VisibleDescription()
			})
		end)
	end

	self.NotesEdit = bottom:Add("eternity_button")
	self.NotesEdit:DockMargin(5, 0, 0, 0)
	self.NotesEdit:Dock(RIGHT)
	self.NotesEdit:SetWide(80)
	self.NotesEdit:SetText("Edit Notes")

	self.NotesEdit.DoClick = function(pnl)
		coroutine.WrapFunc(function()
			local index = string.format("eternity_notes_%s_%s", GAMEMODE:GetConfig("BanRealm"), LocalPlayer():CharID())
			local new = GAMEMODE:OpenGUI("Input", "string", "Edit Notes", {
				Default = cookie.GetString(index, ""),
				Multiline = true,
				Max = 2048
			})

			cookie.Set(index, new)
		end)
	end

	if not LocalPlayer():GetActiveSpecies().BlockNameChange then
		self.NameEdit = bottom:Add("eternity_button")
		self.NameEdit:Dock(RIGHT)
		self.NameEdit:SetWide(80)
		self.NameEdit:SetText("Edit Name")

		self.NameEdit.DoClick = function(pnl)
			coroutine.WrapFunc(function()
				local new = GAMEMODE:OpenGUI("Input", "string", "Edit Name", {
					Default = LocalPlayer():RPName(),
					Max = 30
				})

				netstream.Send("SetName", {
					Name = new
				})
			end)
		end
	end

	-- Holy shit I hate scroll panels
	self.Scroll = self.Content:Add("eternity_scrollpanel")
	self.Scroll:DockMargin(2, 0, 0, 0)
	self.Scroll:Dock(FILL)
	self.Scroll:InvalidateParent(true)

	self.Scroll:UpdateLayout()

	self:UpdateCharacter()

	local languages = "Languages: "
	local tab = {}

	for _, v in pairs(LocalPlayer():GetLanguages()) do
		table.insert(tab, LANGUAGES[v].Name)
	end

	languages = languages .. (#tab > 0 and table.concat(tab, ", ") or "N/A")

	self.Languages = bottom:Add("eternity_label")
	self.Languages:Dock(FILL)
	self.Languages:SetFont("eternity.labelsmall")
	self.Languages:SetText(languages)
end

local function AddSlots(parent, slots)
	for _, v in pairs(slots) do
		local inv = parent:Add("eternity_itemgrid")

		inv:DockMargin(0, 0, 0, GAMEMODE:GetConfig("ItemIconMargin") * 2)
		inv:Dock(TOP)

		inv:Setup(LocalPlayer():GetInventory(v))
	end
end

function PANEL:CreateInventory()
	self.Inventory = self.Content:Add("eternity_itemgrid")
	self.Inventory:Setup(LocalPlayer():GetInventory("Main"))

	self.Equipment = self.Content:Add("eternity_panel")

	self.Equipment:Dock(RIGHT)
	self.Equipment:SetWide(GAMEMODE:GetConfig("ItemIconSize"))

	AddSlots(self.Equipment, LocalPlayer():GetActiveSpecies().EquipmentSlots)

	self.Armor = self.Equipment:Add("eternity_label")

	self.Armor:DockMargin(2, 0, 0, 0)
	self.Armor:Dock(TOP)
	self.Armor:SetFont("eternity.labeltiny")
	self.Armor:SetTall(24)
	self.Armor.Think = function(pnl)
		local level = LocalPlayer():GetArmorLevel()

		local resist = (1.0 - level.DamageScale) * 100
		local speed = (1.0 - level.Speed) * 100

		pnl:SetText(string.format("Resist: %s\nSlow: %s", resist, speed))
	end

	self.Preview = self.Content:Add("eternity_liveview")
	self.Preview:Dock(RIGHT)
	self.Preview:SetWide(200)
	self.Preview:SetEntity(LocalPlayer())
	self.Preview:SetFOV(25)

	self.Weapons = self.Content:Add("eternity_panel")
	self.Weapons:Dock(RIGHT)
	self.Weapons:SetWide(GAMEMODE:GetConfig("ItemIconSize"))

	AddSlots(self.Weapons, LocalPlayer():GetActiveSpecies().WeaponSlots)
end

function PANEL:UpdateBusinessItems()
	self.List.Canvas:Clear()

	local alt = true

	for _, v in SortedPairsByValue(LocalPlayer():GetBuyableItems()) do
		local item = self.List:Add("eternity_businesspanel")

		item:Dock(TOP)
		item:SetTall(64)
		item:SetAlt(alt)
		item:Setup(v)

		alt = not alt

		self.List:AddItem(item)
	end

	self.List:InvalidateParent(true)
	self.List:AutoSize()
	self.List:UpdateLayout()
end

function PANEL:UpdateBusinessMoney()
	for _, v in pairs(self.List.Canvas:GetChildren()) do
		v:UpdateMoney()
	end

	for k, v in pairs(LICENSES) do
		if LICENSES[k].City and GAMEMODE:WorldArea() > WORLDAREA_CITY then
			continue
		end

		local owned = LocalPlayer():HasLicense(k)

		if not owned and not v.Price then
			continue
		end

		self["License" .. k]:SetDisabled(owned or not LocalPlayer():HasMoney(v.Price))
	end

end

netstream.Hook("UpdateBusiness", function(data)
	local ui = GAMEMODE:GetGUI("PlayerMenu")

	if not IsValid(ui) or ui.Active != "Business" then
		return
	end

	if data.Items then
		ui:UpdateBusinessItems()
	end

	ui:UpdateBusinessMoney()
end)

function PANEL:CreateBusiness()
	local left = self.Content:Add("eternity_panel")

	left:DockMargin(0, 0, 5, 0)
	left:Dock(LEFT)
	left:SetWide(200)

	for k, v in SortedPairs(LICENSES, true) do
		if LICENSES[k].City and GAMEMODE:WorldArea() > WORLDAREA_CITY then
			continue
		end

		local owned = LocalPlayer():HasLicense(k)

		if not owned and not v.Price then
			continue
		end

		self["License" .. k] = left:Add("eternity_button")

		self["License" .. k]:DockMargin(0, 5, 0, 0)
		self["License" .. k]:Dock(BOTTOM)
		self["License" .. k]:SetText(v.Price and string.format("%s - %s", v.Name, v.Price) or v.Name)

		self["License" .. k].DoClick = function(pnl)
			netstream.Send("BuyLicense", {
				License = k
			})
		end
	end

	local text = "If you don't own a business license you can buy one by clicking one of the buttons below to get started.\n\nBuying a new license will revoke any current ones. This will not refund any money."

	if GAMEMODE:WorldArea() > WORLDAREA_CITY then
		text = "You've left the city. Away from any stable supplier, there's no way to access the normal Combine business menus outside the city. Those with access to the grey and black markets, however, may still continue to operate.\n\nYou must return to the city to access your business license again."
	end

	self.Label = left:Add("eternity_label")
	self.Label:Dock(FILL)
	self.Label:SetFont("eternity.labelsmall")
	self.Label:SetWrap(true)
	self.Label:SetContentAlignment(7)
	self.Label:SetText(text)

	self.List = self.Content:Add("eternity_scrollpanel")
	self.List:Dock(FILL)

	self:UpdateBusinessItems()
	self:UpdateBusinessMoney()
end


function PANEL:CreatePatrolTeams()
	local bottom = self.Content:Add("eternity_panel")

	bottom:DockMargin(0, 5, 0, 0)
	bottom:Dock(BOTTOM)
	bottom:SetTall(22)

	self.RefreshButton = bottom:Add("eternity_button")
	self.RefreshButton:DockMargin(0, 0, 5, 0)
	self.RefreshButton:Dock(LEFT)
	self.RefreshButton:SetWide(200)
	self.RefreshButton:SetText("Refresh")

	self.RefreshButton.DoClick = function(pnl)
		self:UpdatePatrolTeams()
	end

	if LocalPlayer():HasCombinePermission(COMBINE_SQUADHUD_CREATETEAM) then
		self.CreatePatrolButton = bottom:Add("eternity_button")
		self.CreatePatrolButton:DockMargin(0, 0, 5, 0)
		self.CreatePatrolButton:Dock(LEFT)
		self.CreatePatrolButton:SetWide(105)
		self.CreatePatrolButton:SetText("Create Patrol Team")
		self.CreatePatrolButton:SetDisabled(LocalPlayer():Squad() != "")

		self.CreatePatrolButton.DoClick = function(pnl)
			pnl:SetDisabled(true)

			coroutine.WrapFunc(function()
				local name = string.format("PT-%s", LocalPlayer():VisibleCitizenNumber())

				local password = GAMEMODE:OpenGUI("Input", "string", "Password", {
					Max = 10
				})

				netstream.Send("CreateNewSquad", {
					Name = name,
					Password = password
				})
			end)
		end
	end

	if LocalPlayer():HasCombinePermission(COMBINE_SQUADHUD_CREATETEAM) then
		self.CreateFireButton = bottom:Add("eternity_button")
		self.CreateFireButton:DockMargin(0, 0, 5, 0)
		self.CreateFireButton:Dock(LEFT)
		self.CreateFireButton:SetWide(105)
		self.CreateFireButton:SetText("Create Fire Team")
		self.CreateFireButton:SetDisabled(LocalPlayer():Squad() != "")

		self.CreateFireButton.DoClick = function(pnl)
			pnl:SetDisabled(true)

			coroutine.WrapFunc(function()
				local name = string.format("FT-%s", LocalPlayer():VisibleCitizenNumber())

				local password = GAMEMODE:OpenGUI("Input", "string", "Password", {
					Max = 10
				})

				netstream.Send("CreateNewSquad", {
					Name = name,
					Password = password
				})
			end)
		end
	end

	self.CommandButton = bottom:Add("eternity_button")
	self.CommandButton:DockMargin(0, 0, 5, 0)
	self.CommandButton:Dock(LEFT)
	self.CommandButton:SetWide(100)
	self.CommandButton:SetText("Take Command")
	self.CommandButton:SetDisabled(true)

	self.CommandButton.DoClick = function(pnl)
		netstream.Send("TakeSquadCommand", {
			Squad = self.SelectedSquad
		})

		self:UpdatePatrolTeams()
	end

	self.DisbandButton = bottom:Add("eternity_button")
	self.DisbandButton:DockMargin(0, 0, 5, 0)
	self.DisbandButton:Dock(LEFT)
	self.DisbandButton:SetWide(60)
	self.DisbandButton:SetText("Disband")
	self.DisbandButton:SetDisabled(true)

	self.DisbandButton.DoClick = function(pnl)
		netstream.Send("DisbandSquad", {
			Squad = self.SelectedSquad
		})

		self:UpdatePatrolTeams()
	end

	self.LeaveButton = bottom:Add("eternity_button")
	self.LeaveButton:DockMargin(0, 0, 5, 0)
	self.LeaveButton:Dock(RIGHT)
	self.LeaveButton:SetWide(60)
	self.LeaveButton:SetText("Leave")
	self.LeaveButton:SetDisabled(true)

	self.LeaveButton.DoClick = function(pnl)
		netstream.Send("LeaveSquad")

		self:UpdatePatrolTeams()
	end

	self.JoinButton = bottom:Add("eternity_button")
	self.JoinButton:DockMargin(0, 0, 5, 0)
	self.JoinButton:Dock(RIGHT)
	self.JoinButton:SetWide(60)
	self.JoinButton:SetText("Join")
	self.JoinButton:SetDisabled(true)

	self.JoinButton.DoClick = function(pnl)
		netstream.Send("JoinSquad", {
			Squad = self.SelectedSquad
		})

		self:UpdatePatrolTeams()
	end

	self.SquadList = self.Content:Add("eternity_listview")
	self.SquadList:DockMargin(0, 0, 5, 0)
	self.SquadList:Dock(LEFT)
	self.SquadList:SetWide(200)

	self.SquadList:AddColumn("Name", 1)
	self.SquadList:AddColumn("Players", 2):SetFixedWidth(60)

	self.SquadList.OnRowSelected = function(pnl, index, row)
		self:UpdatePlayerList(row:GetValue(1))
	end

	self.PlayerList = self.Content:Add("eternity_listview")
	self.PlayerList:Dock(FILL)

	self.PlayerList:AddColumn("Name", 1)
	self.PlayerList:AddColumn("Distance", 2):SetFixedWidth(200)

	self.PlayerList.Think = function(pnl)
		for _, v in pairs(self.PlayerList:GetLines()) do
			if not IsValid(v.Player) then
				self.PlayerList:RemoveLine(v:GetID())

				break
			end

			if v.Player:Squad() != LocalPlayer():Squad() or v.Player:GetNoDraw() then
				v:SetValue(2, "")

				continue
			end

			local dist = v.Player:EyePos():Distance(LocalPlayer():EyePos())

			v:SetValue(2, math.Round(dist * 0.0254) .. " Meters")
		end
	end

	self:UpdatePatrolTeams()
end

function PANEL:UpdatePatrolTeams()
	local squads = {}

	for _, v in pairs(player.GetAll()) do
		if v:Team() != LocalPlayer():Team() then
			continue
		end

		local squad = v:Squad()

		if squad == "" then
			continue
		end

		squads[squad] = (squads[squad] or 0) + 1
	end

	self.SquadList:Clear()
	self.PlayerList:Clear()

	if IsValid(self.CreatePatrolButton) then
		self.CreatePatrolButton:SetDisabled(LocalPlayer():Squad() != "")
		self.CreateFireButton:SetDisabled(LocalPlayer():Squad() != "")
	end

	self.CommandButton:SetDisabled(true)
	self.DisbandButton:SetDisabled(true)
	self.LeaveButton:SetDisabled(true)
	self.JoinButton:SetDisabled(true)

	for k, v in pairs(squads) do
		local joined = k == LocalPlayer():Squad()

		local panel = self.SquadList:AddLine(k, v .. (joined and "*" or ""))

		if joined then
			self.SquadList:SelectItem(panel)
		end
	end

	self.SquadList:SortByColumn(1)
end

function PANEL:UpdatePlayerList(squad)
	self.SelectedSquad = squad
	self.PlayerList:Clear()

	for _, v in pairs(GAMEMODE:GetSquadMembers(squad)) do
		self.PlayerList:AddLine(v:VisibleRPName() .. (v:SquadLeader() and " (LEADER)" or ""), 0).Player = v
	end

	local leader = GAMEMODE:GetSquadLeader(squad)

	self.CommandButton:SetDisabled(IsValid(leader))
	self.DisbandButton:SetDisabled(not LocalPlayer():IsAdmin() and (LocalPlayer():Squad() != squad or not LocalPlayer():SquadLeader()))
	self.LeaveButton:SetDisabled(squad != LocalPlayer():Squad())
	self.JoinButton:SetDisabled(LocalPlayer():Squad() != "")
end

function PANEL:CreateSettings()
	local right = self.Content:Add("eternity_panel")

	right:DockMargin(5, 0, 0, 0)
	right:Dock(RIGHT)
	right:SetWide(120)

	self.Rejoin = right:Add("eternity_button")
	self.Rejoin:SetSize(120, 22)
	self.Rejoin:SetText("Rejoin")
	self.Rejoin:DockMargin(0, 5, 0, 0)
	self.Rejoin:Dock(BOTTOM)

	self.Rejoin.DoClick = function(pnl)
		RunConsoleCommand("retry")
	end

	self.Suicide = right:Add("eternity_button")
	self.Suicide:SetSize(120, 22)
	self.Suicide:SetText("Suicide")
	self.Suicide:DockMargin(0, 5, 0, 0)
	self.Suicide:Dock(BOTTOM)

	self.Suicide.DoClick = function(pnl)
		RunConsoleCommand("kill")
	end

	self.Contentpack = right:Add("eternity_button")
	self.Contentpack:SetSize(120, 22)
	self.Contentpack:SetText("View server content")
	self.Contentpack:DockMargin(0, 5, 0, 0)
	self.Contentpack:Dock(TOP)

	self.Contentpack.DoClick = function(pnl)
		gui.OpenURL(string.format("https://steamcommunity.com/sharedfiles/filedetails/?id=%s", GAMEMODE:GetConfig("CollectionID")))
	end

	self.Changelog = right:Add("eternity_button")
	self.Changelog:SetSize(120, 22)
	self.Changelog:SetText("View changelog")
	self.Changelog:DockMargin(0, 5, 0, 0)
	self.Changelog:Dock(TOP)

	self.Changelog.DoClick = function(pnl)
		GAMEMODE:OpenGUI("MOTD")
	end

	if not GAMEMODE.MOTD then
		self.Changelog:SetDisabled(true)
	end

	self.Website = right:Add("eternity_button")
	self.Website:SetSize(120, 22)
	self.Website:SetText("Visit website")
	self.Website:DockMargin(0, 5, 0, 0)
	self.Website:Dock(TOP)

	self.Website.DoClick = function(pnl)
		gui.OpenURL(GAMEMODE:GetConfig("Website"))
	end

	self.EditCTP = right:Add("eternity_button")
	self.EditCTP:SetSize(120, 22)
	self.EditCTP:SetText("Edit Thirdperson")
	self.EditCTP:DockMargin(0, 5, 0, 0)
	self.EditCTP:Dock(TOP)

	self.EditCTP.DoClick = function(pnl)
		RunConsoleCommand("ctp_toggle_menu")
	end

	self.SettingsPanel = self.Content:Add("eternity_scrollpanel")
	self.SettingsPanel:Dock(FILL)

	local colors = GAMEMODE:GetConfig("UIColors")
	local odd = true

	for _, v in pairs(GAMEMODE.SettingCategories) do
		local found = false

		for _, key in ipairs(v) do
			local setting = GAMEMODE.PlayerSettings[key]

			if not setting.Filter or LocalPlayer():CanSeeSetting(setting.Filter) then
				found = true

				break
			end
		end

		if not found then
			continue
		end

		local background = self.SettingsPanel.Canvas:Add("eternity_panel")

		background:Dock(TOP)
		background:SetDrawColor(colors.FillLight)
		background:SetDrawBorder(colors.FillMedium)

		local title = background:Add("eternity_label")

		title:DockMargin(5, 5, 5, 5)
		title:Dock(FILL)
		title:SetFont("eternity.labelgiant")
		title:SetContentAlignment(4)
		title:SetText(v.Category)

		background:SetTall(35)

		odd = true

		for _, key in ipairs(v) do
			local setting = GAMEMODE.PlayerSettings[key]

			if not setting.Filter or LocalPlayer():CanSeeSetting(setting.Filter) then
				local panel = self.SettingsPanel.Canvas:Add("eternity_settingpanel")

				panel:Dock(TOP)
				panel:Setup(key, odd)
	
				odd = not odd
			end
		end
	end

	self.SettingsPanel:InvalidateParent(true)

	self.SettingsPanel:AutoSize()
	self.SettingsPanel:UpdateLayout()

end

vgui.Register("eternity_playermenu", PANEL, "eternity_basemenu")

GM:RegisterGUI("PlayerMenu", function()
	return vgui.Create("eternity_playermenu")
end, true)
