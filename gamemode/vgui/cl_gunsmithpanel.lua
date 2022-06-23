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
		pnl:SetLookAng(tab.angles + Angle(0, 0, 15))
		pnl:SetFOV(2.5)
	end

	local right = self:Add("eternity_panel")

	right:DockMargin(5, 0, 5, 0)
	right:Dock(RIGHT)
	right:SetWide(105)

	local bottom = right:Add("eternity_panel")

	bottom:DockMargin(0, 0, 0, 5)
	bottom:Dock(BOTTOM)
	bottom:SetTall(24)

	self.Modify = bottom:Add("eternity_button")
	self.Modify:Dock(FILL)
	self.Modify:SetText("Modify Weapon")

    self.Modify.DoClick = function(pnl)
		self:ModifyItem()
	end

	self.Price = right:Add("eternity_label")
	self.Price:DockMargin(2, 0, 0, 0)
	self.Price:Dock(FILL)
	self.Price:SetContentAlignment(4)
	self.Price:SetFont("eternity.labeltiny")
	self.Price:SetText("Price")

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

function PANEL:Setup(weapon, variant, config, item, alt)
    self._Alt = alt

	self.Icon:SetModel(config.Model)
	self.Icon:GetEntity():SetSkin(config.Skin)

	for k, v in pairs(config.Bodygroups) do
		if isnumber(k) then
			self.Icon:GetEntity():SetBodygroup(k, v)
		end
	end

	self.Name:SetText(string.format("%s Variant", config.Title))
	self.Description:SetText(config.Description)

    local cost = config.Cost

    if cost ~= 1 then
        self.Price:SetText(string.format("%d Weapon Parts", cost))
    else
        self.Price:SetText(string.format("%d Weapon Part", cost))
    end

    self.Meta = {}
    self.Meta.Weapon = weapon
    self.Meta.Variant = variant
    self.Meta.Config = config
    self.Meta.Item = item
end

function PANEL:ModifyItem()
    if self.Meta == nil then
        return
    end

	local tab = {
		ID = self.Meta.Item.Proxy.NetworkID,
        Variant = self.Meta.Variant
	}

	netstream.Send("ModifyWeaponItemVariant", tab)

	if self.Meta.Variant == "Default" then
		GAMEMODE:CloseGUI("GunsmithMenu")
	end
end

function PANEL:Think()
    if self.Meta == nil then
        return
    end

	local item = GAMEMODE:GetItem(self.Meta.Item.Proxy.NetworkID)

    local selected = item.Selected

    if selected == nil then
        selected = "Default"
    end

    if self.Meta.Variant == selected then
        self.Modify:SetText("Deconstruct")
        self.Modify:SetDisabled(false)

		local cost = self.Meta.Config.Refund

		if cost ~= 1 then
			self.Price:SetText(string.format("+%d Weapon Parts", cost))
		else
			self.Price:SetText(string.format("+%d Weapon Part", cost))
		end

		self.Price:SetColor(Color(0, 155, 255))
    else
        self.Modify:SetText("Construct")

        if selected ~= "Default" then
            self.Modify:SetDisabled(true)
        else
            self.Modify:SetDisabled(false)
        end

		local cost = self.Meta.Config.Cost
		local have = LocalPlayer():GetItemCount("currency_gunparts")

		if have < cost then
			self.Price:SetColor(Color(255, 0, 0))
		else
			self.Price:SetColor(Color(0, 255, 0))
		end

		if self.Meta.Variant ~= "Default" then
			self.Price:SetText(string.format("%d/%d Weapon Parts", have, cost))
		else
			self.Price:SetText("")
		end
    end
end

function PANEL:Paint(w, h)
	local colors = GAMEMODE:GetConfig("UIColors")

	if self._Alt then
		surface.SetDrawColor(ColorAlpha(colors.Border, 130))
		surface.DrawRect(0, 0, w, h)
	end
end

vgui.Register("eternity_gunsmithpanel", PANEL, "eternity_panel")