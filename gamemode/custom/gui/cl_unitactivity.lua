local ACTIVE = nil
local PANEL = {}

function PANEL:Init()
    netstream.Send("UnitActivityFetchAll")
    ACTIVE = self

	self:SetSize(600, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Unit Activity Management")

	local bottom1 = self:Add("eternity_panel")

	bottom1:DockMargin(0, 5, 0, 0)
	bottom1:Dock(BOTTOM)
	bottom1:SetTall(22)
 
	self.Refresh = bottom1:Add("eternity_button")
	self.Refresh:Dock(LEFT)
    self.Refresh:SetWide(140)
    self.Refresh:SetText("Refresh Listing")

    self.Refresh.DoClick = function()
        netstream.Send("UnitActivityFetchAll")
        ACTIVE = self
    end

	self.RevokeAccess = bottom1:Add("eternity_button")
	self.RevokeAccess:Dock(RIGHT)
	self.RevokeAccess:SetWide(200)
	self.RevokeAccess:SetText("Revoke Civil Protection Rank")

    self.RevokeAccess.DoClick = function(pnl)
        netstream.Send("UnitActivityRemoveID", {
            CharID = self.SelectedUnit
        })

        self.RevokeAccess:SetDisabled(true)
	end

    self.RevokeAccess:SetDisabled(true)

	self.List = self:Add("eternity_listview")
    self.List:Dock(LEFT)
    self.List:SetWide(580)

	self.List:SetMultiSelect(false)

    self.List:AddColumn("CID"):SetFixedWidth(125)
    self.List:AddColumn("Squad"):SetFixedWidth(125)
    self.List:AddColumn("Identification"):SetFixedWidth(150)
    self.List:AddColumn("Last Activity")

	self.List.OnRowSelected = function(pnl, index, row)
		self.SelectedUnit = row.CharID

        self.RevokeAccess:SetDisabled(false)
	end

	self:MakePopup()
	self:Center()
end

vgui.Register("eternity_unitactivity", PANEL, "eternity_basepanel")

GM:RegisterGUI("UnitActivity", function()
	return vgui.Create("eternity_unitactivity")
end, true)

netstream.Hook("UnitActivityFetchAllClient", function(data)
    if ACTIVE and IsValid(ACTIVE) and ispanel(ACTIVE) and ACTIVE:IsValid() then
        ACTIVE.List:Clear()
        ACTIVE.RevokeAccess:SetDisabled(true)

        for k,v in pairs(data.Data) do
            local cid = string.format("%05i", v.CitizenNumber)
            local squad = string.upper(v.CombineSquad)
            local name = ""

            if v.SpeciesState == "police_recruit" then
                name = string.format("Rct.%s", cid)
            elseif v.SpeciesState == "police_unit" then
                name = string.format("%s.%02i.%s", squad, v.CombineRank, cid)
            elseif v.SpeciesState == "police_eliteunit" then
                name = string.format("%s.EU.%s", squad, cid)
            elseif v.SpeciesState == "police_adjutant" then
                name = string.format("%s.AdJ.%s", squad, cid)
            elseif v.SpeciesState == "police_squadleader" then
                name = string.format("%s.SqL.%s", squad, cid)
            elseif v.SpeciesState == "police_captain" then
                name = string.format("PrC.%s", cid)
            end

            local lastactivity = string.NiceTime(os.time() - v.LastFlagged) .. " ago"

            if v.LastFlagged == 0 then
                lastactivity = "No Activity"
            end

            ACTIVE.List:AddLine(cid, squad, name, lastactivity).CharID = v.id
        end
    end
end)