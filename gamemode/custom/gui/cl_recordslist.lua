local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Citizen Records")

	local bottom1 = self:Add("eternity_panel")

	bottom1:DockMargin(0, 5, 0, 0)
	bottom1:Dock(BOTTOM)
	bottom1:SetTall(22)

	self.Refresh = bottom1:Add("eternity_button")
	self.Refresh:Dock(LEFT)
	self.Refresh:SetWide(100)
	self.Refresh:SetText("Refresh")

	self.Refresh.DoClick = function()
		self:Populate()
	end

	self.SaveRecord = bottom1:Add("eternity_button")
	self.SaveRecord:Dock(RIGHT)
	self.SaveRecord:SetWide(285)
	self.SaveRecord:SetText("Save Record Changes")

	self.SaveRecord.DoClick = function()
		netstream.Send("RecordsListUpdateNotes", {
			Target = self.Target,
			CharID = self.CharID,
			Notes = self.Notes:GetValue()
		})

		self.SaveRecord:SetDisabled(true)
	end

	self.SaveRecord:SetDisabled(true)

	local right1 = self:Add("eternity_panel")

	right1:Dock(RIGHT)
	right1:SetWide(290)

	self.Notes = right1:Add("eternity_textentry")
	self.Notes:DockMargin(5, 0, 0, 0)
	self.Notes:Dock(FILL)
	self.Notes:SetUpdateOnType(true)
	self.Notes:SetMultiline(true)

	self.Notes.OnValueChange = function(pnl, val)
		local disabled = false

		if self.Target == nil or val == self.Target:CitizenRecord() then
			disabled = true
		elseif #val > 2048 then
			disabled = true
		end

		if not disabled and LocalPlayer():HasCombinePermission(COMBINE_RECORDS_WRITEABLE) then
			self.SaveRecord:SetDisabled(false)
		else
			self.SaveRecord:SetDisabled(true)
		end
	end

	self.Notes.AllowInput = function(pnl, char)
		if self.Target == nil then
			return true
		end

		if not LocalPlayer():HasCombinePermission(COMBINE_RECORDS_WRITEABLE) then
			return true
		end

		if #pnl:GetValue() < 2048 then
			return false
		else
			return true
		end
	end

	self.List = self:Add("eternity_listview")
	self.List:Dock(FILL)

	self.List:SetMultiSelect(false)

	self.List:AddColumn("CID"):SetFixedWidth(50)
	self.List:AddColumn("Registry Entry")

	self.List.OnRowSelected = function(pnl, index, row)
		netstream.Send("RecordsListGet", {
			Target = row.Ent,
			CharID = row.Char,
		})
	end


	self:MakePopup()
	self:Center()

	self:Populate()
end

local blacklist = {
	["combineadmin"] = true,
	["scientist_leader"] = true,
	["scientist_normal"] = true
}

function PANEL:Populate()
	self.Target = nil
	self.Notes:SetValue("")
	self.SaveRecord:SetDisabled(true)
	self.List:Clear()

	local characters = {}

	for _,v in pairs(player.GetAll()) do
		if not v:HasCharacter() then
			continue
		end

		if v == LocalPlayer() then
			continue
		end

		local species = v:GetActiveSpecies()

		if species:GetClassName() == "species_vortigaunt" and v:SpeciesState() ~= "free" then
			table.insert(characters, {v:VisibleRPName(), v:VisibleCitizenNumber(), v})
		elseif species:GetClassName() == "species_human" then
			local state = v:SpeciesState()

			if string.StartWith(state, "citizen") then
				table.insert(characters, {v:RPName(), v:VisibleCitizenNumber(), v})
			elseif string.StartWith(state, "police_") then
				local flaggedLevel = species.SpeciesStates[state].Flagged.CombineLevel

				local lply = LocalPlayer():SpeciesState()
				local llevel = COMBINE_LEVEL_CITIZEN
				local lstate = species.SpeciesStates[lply]

				if lstate then
					if lstate.CombineLevel then
						llevel = math.max(llevel, lstate.CombineLevel)
					end

					if lstate.Flagged and lstate.Flagged.CombineLevel and LocalPlayer():IsFlagged() then
						llevel = math.max(llevel, lstate.Flagged.CombineLevel)
					end
				elseif species.SpeciesDefaults.CombineLevel then
					llevel = math.max(llevel, species.SpeciesDefaults.CombineLevel)
				end

				if flaggedLevel <= llevel then
					table.insert(characters, {v:RPName(), v:VisibleCitizenNumber(), v})
				end
			elseif not blacklist[state] then
				table.insert(characters, {v:RPName(), v:VisibleCitizenNumber(), v})
			end
		end
	end

	for k, v in pairs(characters) do
		local line = self.List:AddLine(v[2], v[1])

		line.Ent = v[3]
		line.Char = v[3]:CharID()
	end
end

vgui.Register("eternity_recordslist", PANEL, "eternity_basepanel")

GM:RegisterGUI("RecordList", function()
	return vgui.Create("eternity_recordslist")
end, true)

netstream.Hook("RecordsListSend", function(data)
	local ui = GAMEMODE:GetGUI("RecordList")

	if not IsValid(ui) then
		return
	end

	ui.Target = data.Target
	ui.CharID = data.CharID
	ui.Notes:SetValue(data.Record)
end)
