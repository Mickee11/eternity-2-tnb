local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
	self:DockPadding(10, 10, 10, 10)

	self:SetAllowEscape(true)

	self:SetDrawTopBar(true)
	self:SetTitle("Gear Requisitions")

	self.List = self:Add("eternity_scrollpanel")
	self.List:Dock(FILL)
	self.List.Canvas:Clear()

	local alt = true

	for _,v in SortedPairs(GAMEMODE:GetPlayerRequisitionItems(LocalPlayer())) do
		if not class.Get(v) then
			continue
		end

		local item = self.List:Add("eternity_requisitionpanel")

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

	self:MakePopup()
	self:Center()
end

vgui.Register("eternity_gearrequisitions", PANEL, "eternity_basepanel")

GM:RegisterGUI("GearRequisitions", function()
	return vgui.Create("eternity_gearrequisitions")
end, true)
