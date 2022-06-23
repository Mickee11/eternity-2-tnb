local PANEL = {}

function PANEL:Init()
	self:SetSize(600, 400)
    self:DockPadding(10, 10, 10, 10)

    local left  = self:Add("eternity_panel")
    left:DockMargin(0, 0, 10, 0)
    left:Dock(LEFT)
    left:SetTall(400)
    left:SetWide(280)

    local right  = self:Add("eternity_panel")
    right:DockMargin(0, 0, 0, 0)
    right:Dock(RIGHT)
    right:SetTall(400)
    right:SetWide(290)

    self.Recipes = left:Add("eternity_listview")
    self.Recipes:Dock(FILL)
    self.Recipes:SetMultiSelect(false)

    self.Recipes:AddColumn("Recipe"):SetFixedWidth(200)
    self.Recipes:AddColumn("Ingredients")

    self.Recipes.OnRowSelected = function(pnl, index, row)
        self.SelectedRecipe = row.Inspectable

        right:Clear()

        local item = right:Add("eternity_craftingpanel")

        item:Dock(TOP)
        item:SetTall(400)
        item:SetWide(290)
        item:Setup(self.SelectedRecipe, self.Category)
    end

    self:SetAllowEscape(true)
    self:SetDrawTopBar(true)

	self.List = self:Add("eternity_scrollpanel")
    self.List:Dock(FILL)
end

function PANEL:Populate()
    self.Recipes:Clear()

    local alt = true

    for k,v in SortedPairs(self.Procedures) do
        local item = class.Get(k)
        local name = ""

        if not item then
            name = k
        else
            name = string.Replace(item:GetName(), " x0", "")
        end

        local ingredients = 0

        for cat,count in pairs(v) do
            if cat == "Returns" then
                continue
            end

            ingredients = ingredients + count
        end

        self.Recipes:AddLine(name, ingredients).Inspectable = k
    end
    
    self:SetTitle(self.CatTitle)
end

function PANEL:Setup(type)
    local enum = CRAFTING[type]

    if not enum then
        return
    end

    self.CatTitle = enum.PrintName
    self.Category = type
    self.Procedures = enum.Recipes

    self:Populate()
end

vgui.Register("eternity_craftingmenu", PANEL, "eternity_basepanel")

GM:RegisterGUI("CraftingMenu", function(type)
    local pnl = vgui.Create("eternity_craftingmenu")

    pnl:Setup(type)

	pnl:MakePopup()
	pnl:Center()

	return pnl
end, true)
