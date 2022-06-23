local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Unit Access Management")

	local bottom1 = self:Add("eternity_panel")

	bottom1:DockMargin(0, 5, 0, 0)
	bottom1:Dock(BOTTOM)
	bottom1:SetTall(22)

	self.Refresh = bottom1:Add("eternity_button")
	self.Refresh:Dock(LEFT)
    self.Refresh:SetWide(140)
    self.Refresh:SetText("Refresh Listing")

    self.Refresh.DoClick = function()
        self:Populate()
    end

	self.EditSquad = bottom1:Add("eternity_button")
	self.EditSquad:Dock(RIGHT)
	self.EditSquad:SetWide(100)
	self.EditSquad:SetText("Edit Squad")

    self.EditSquad.DoClick = function(pnl)
        pnl:SetDisabled(true)

        coroutine.WrapFunc(function()
            local squad = GAMEMODE:OpenGUI("Input", "string", "Enter Unit Squad", {
                Default = self.SelectedUnit:CombineSquad(),
                Max = 10
            })

            netstream.Send("UnitManagementSetSquad", {
                Requested = string.upper(squad),
                Unit = self.SelectedUnit,
                Char = self.SelectedUnit:CharID()
            })
        end)
	end

    self.EditSquad:SetDisabled(true)
    
	self.EditGrade = bottom1:Add("eternity_button")
	self.EditGrade:Dock(RIGHT)
    self.EditGrade:SetWide(100)
    self.EditGrade:DockMargin(0, 0, 10, 0)
	self.EditGrade:SetText("Edit Grade")

    self.EditGrade.DoClick = function(pnl)
        pnl:SetDisabled(true)

        coroutine.WrapFunc(function()
            local grade = GAMEMODE:OpenGUI("Input", "number", "Enter Unit Grade", {
                Default = self.SelectedUnit:CombineRank()
            })

            grade = tonumber(grade)

            netstream.Send("UnitManagementSetGrade", {
                Requested = math.Clamp(grade, 1, 4),
                Unit = self.SelectedUnit,
                Char = self.SelectedUnit:CharID()
            })
        end)
	end

    self.EditGrade:SetDisabled(true)
    
	self.PromoteClass = bottom1:Add("eternity_button")
	self.PromoteClass:Dock(RIGHT)
    self.PromoteClass:SetWide(100)
    self.PromoteClass:DockMargin(0, 0, 10, 0)
	self.PromoteClass:SetText("Promote Class")

	self.PromoteClass.DoClick = function()
		netstream.Send("UnitManagementPromoteClass", {
			Unit = self.SelectedUnit,
            Char = self.SelectedUnit:CharID()
		})
	end

    self.PromoteClass:SetDisabled(true)
    
	self.DemoteClass = bottom1:Add("eternity_button")
	self.DemoteClass:Dock(RIGHT)
    self.DemoteClass:SetWide(100)
    self.DemoteClass:DockMargin(0, 0, 10, 0)
	self.DemoteClass:SetText("Demote Class")

	self.DemoteClass.DoClick = function()
		netstream.Send("UnitManagementDemoteClass", {
			Unit = self.SelectedUnit,
            Char = self.SelectedUnit:CharID()
		})
	end

	self.DemoteClass:SetDisabled(true)

	self.List = self:Add("eternity_listview")
    self.List:Dock(LEFT)
    self.List:SetWide(580)

	self.List:SetMultiSelect(false)

    self.List:AddColumn("Registry Entry"):SetFixedWidth(150)
    self.List:AddColumn("CID"):SetFixedWidth(50)
    self.List:AddColumn("Identification")

	self.List.OnRowSelected = function(pnl, index, row)
		self.SelectedUnit = row.Ent

        self.PromoteClass:SetDisabled(true)
        self.DemoteClass:SetDisabled(true)
        self.EditGrade:SetDisabled(true)
        self.EditSquad:SetDisabled(true)

        if self.SelectedUnit:SpeciesState() == "police_squadleader" or self.SelectedUnit:SpeciesState() == "police_adjutant" then
            self.EditGrade:SetDisabled(true)
            self.EditSquad:SetDisabled(false)
            self.PromoteClass:SetDisabled(true)
            self.DemoteClass:SetDisabled(true)

            if (LocalPlayer():HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) and self.SelectedUnit:SpeciesState() == "police_adjutant") or LocalPlayer():SpeciesState() == "police_captain" then
                self.DemoteClass:SetDisabled(false)
            end 

            if self.SelectedUnit:SpeciesState() == "police_adjutant" and LocalPlayer():SpeciesState() == "police_captain" then
                self.PromoteClass:SetDisabled(true)
            end
        elseif self.SelectedUnit:SpeciesState() == "police_unit" then
            self.EditGrade:SetDisabled(false)
            self.EditSquad:SetDisabled(false)
            self.DemoteClass:SetDisabled(false)
            self.PromoteClass:SetDisabled(true)

            if LocalPlayer():HasCombinePermission(COMBINE_ADMINS_PROMOTE_SQL) then
                self.PromoteClass:SetDisabled(false)
            end
        elseif self.SelectedUnit:SpeciesState() == "police_recruit" then
            self.PromoteClass:SetDisabled(false)
            self.DemoteClass:SetDisabled(true)
            self.EditGrade:SetDisabled(true)
            self.EditSquad:SetDisabled(false)
        end
	end


	self:MakePopup()
	self:Center()

	self:Populate()
end

function PANEL:Populate()
    self.PromoteClass:SetDisabled(true)
    self.DemoteClass:SetDisabled(true)
    self.EditGrade:SetDisabled(true)
    self.EditSquad:SetDisabled(true)

	self.List:Clear()

    local units = {}
    local human = LocalPlayer():GetActiveSpecies() -- Only humans can access this anyway!
    
    for k,v in pairs(player.GetAll()) do
        if v == LocalPlayer() then
            continue
        end

        if not v:HasCharacter() or not v:GetActiveSpecies():GetClassName() == "species_human" then
            continue
        end

        local state = v:SpeciesState()

        if not string.StartWith(state, "police_") then
            continue
        end

        if human.SpeciesStates[LocalPlayer():SpeciesState()].Flagged.CombineLevel <= human.SpeciesStates[state].Flagged.CombineLevel then
            continue
        end

        local name = v:RPName()
        local cid = v:VisibleCitizenNumber()
        local iden = human.SpeciesStates[state].Flagged.VisibleRPName(v, false)

        table.insert(units, {name, cid, iden, ent = v})
    end

    for k,v in pairs(units) do
        self.List:AddLine(v[1], v[2], v[3]).Ent = v.ent
    end
end

vgui.Register("eternity_unitmanagement", PANEL, "eternity_basepanel")

GM:RegisterGUI("UnitManagement", function()
	return vgui.Create("eternity_unitmanagement")
end, true)