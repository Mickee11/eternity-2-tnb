local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
    self:DockPadding(10, 10, 10, 10)

    self:SetAllowEscape(true)

    self:SetDrawTopBar(true)
	self:SetTitle("Weapon Modifications")
end

function PANEL:AddListItem(weapon, name, variant, item, alt)
    local option = self.List:Add("eternity_gunsmithpanel")

    option:Dock(TOP)
    option:SetTall(64)
    option:SetAlt(alt)
    option:Setup(weapon, name, variant, item, alt)

    self.List:AddItem(option)
end

function PANEL:Populate(weapon, item)
    self.List = self:Add("eternity_scrollpanel")
    self.List:Dock(FILL)
    self.List.Canvas:Clear()

    self:AddListItem(weapon, "Default", item.Proxy.Variants.Default, item)

    local alt = true

    for k,v in SortedPairs(item.Proxy.Variants) do
        if k == "Default" then
            continue
        end

        self:AddListItem(weapon, k, v, item, alt)

        alt = not alt
    end
    
	self.List:InvalidateParent(true)
	self.List:AutoSize()
	self.List:UpdateLayout()

    self:MakePopup()
	self:Center()
end

vgui.Register("eternity_gunsmithmenu", PANEL, "eternity_basepanel")

GM:RegisterGUI("GunsmithMenu", function(weapon, item)
    local pnl = vgui.Create("eternity_gunsmithmenu")

    pnl:Populate(weapon, item)

	pnl:MakePopup()
	pnl:Center()

	return pnl
end, true)
