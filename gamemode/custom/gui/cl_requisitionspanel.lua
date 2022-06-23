local PANEL = {}
DEFINE_BASECLASS("eternity_panel")

AccessorFunc(PANEL, "_Alt", "Alt")

function PANEL:Init()
	self.Icon = self:Add("DModelPanel")
	self.Icon:DockMargin(0, 0, 5, 0)
	self.Icon:Dock(LEFT)
	self.Icon:SetWide(64)

	self.Icon.LayoutEntity = function(pnl, ent)
		local tab = PositionSpawnIcon(ent, ent:GetPos())

		pnl:SetCamPos(tab.origin)
		pnl:SetLookAng(tab.angles)
		pnl:SetFOV(tab.fov)
	end

	local right = self:Add("eternity_panel")

	right:DockMargin(5, 0, 5, 0)
	right:Dock(RIGHT)
	right:SetWide(105)

	local bottom = right:Add("eternity_panel")

	bottom:DockMargin(0, 0, 0, 5)
	bottom:Dock(BOTTOM)
	bottom:SetTall(24)

	self.Request = bottom:Add("eternity_button")
	self.Request:Dock(FILL)
	self.Request:SetText("Requisition Item")

    self.Request.DoClick = function(pnl)
		self:RequestItem()
    end

	self.Name = self:Add("eternity_label")
	self.Name:DockMargin(0, 5, 0, 5)
	self.Name:Dock(TOP)
	self.Name:SetTall(14)
	self.Name:SetFont("eternity.labelsmall")
	self.Name:SetText("Name")

	self.Description = self:Add("eternity_label")
	self.Description:Dock(FILL)
	self.Description:SetFont("eternity.labeltiny")
	self.Description:SetWrap(true)
	self.Description:SetContentAlignment(7)
end

function PANEL:Setup(classname)
	local item = class.Get(classname)

	if !item then return end

	self.ItemClass = classname

	self.Icon:SetModel(item:GetModel())
	self.Icon:SetSkin(item:GetSkin())

	local color = item.Color

	if not IsColor(color) then
		color = Color(color.r, color.g, color.b)
	end

	self.Icon:SetColor(color)

	self.Name:SetText(string.Replace(item:GetName(), " x0", ""))
	self.Description:SetText(string.match(item:GetDescription(), "^[^\r\n]*"))
end

function PANEL:RequestItem()
	local tab = {
		Class = self.ItemClass
	}

	netstream.Send("RequestCombineArmoryItem", tab)
end

function PANEL:Paint(w, h)
	local colors = GAMEMODE:GetConfig("UIColors")

	if self._Alt then
		surface.SetDrawColor(ColorAlpha(colors.Border, 130))
		surface.DrawRect(0, 0, w, h)
	end
end

vgui.Register("eternity_requisitionpanel", PANEL, "eternity_panel")