local PANEL = {}
DEFINE_BASECLASS("eternity_panel")

AccessorFunc(PANEL, "_Alt", "Alt")

function PANEL:Init()
    local header = self:Add("eternity_panel")
    header:DockMargin(0, 0, 0, 0)
    header:Dock(TOP)
    header:SetTall(356)
    
	self.Name = header:Add("eternity_label")
	self.Name:DockMargin(0, 0, 0, 10)
	self.Name:Dock(TOP)
	self.Name:SetTall(14)
	self.Name:SetFont("eternity.labelsmall")
	self.Name:SetText("Name")

    self.Ingredients = header:Add("eternity_listview")
    self.Ingredients:Dock(FILL)
    self.Ingredients:SetMultiSelect(false)
    self.Ingredients:SetTall(128)

    self.Ingredients:AddColumn("Ingredient"):SetFixedWidth(200)
    self.Ingredients:AddColumn("Count")

	self.Craft = header:Add("eternity_button")
	self.Craft:Dock(BOTTOM)
    self.Craft:SetText("Craft Item")
    self.Craft:DockMargin(0, 10, 0, 0)
    self.Craft:SetTall(32)

    self.Craft.DoClick = function(pnl)
        self:CraftItem()
        
        self.Craft:SetDisabled(true)

        timer.Simple(0.5, function()
            if IsValid(self) and LocalPlayer():CanCraftItem(self.ItemClass, self.RecipeCategory) then
                self.Craft:SetDisabled(false)
            end
        end)
    end
end

function PANEL:Setup(classname, category)
	local item = class.Get(classname)

    self.ItemClass = classname
    self.RecipeCategory = category

    if item then
        self.Name:SetText(string.Replace(item:GetName(), " x0", ""))
    else
        self.Name:SetText(self.ItemClass)
    end
    
    for k,v in SortedPairs(CRAFTING[self.RecipeCategory].Recipes[self.ItemClass]) do
        if k == "Returns" or v < 1 then
            continue
        end
        
        local ingredient = class.Get(k)

        self.Ingredients:AddLine(string.Replace(ingredient:GetName(), " x0", ""), v)
    end

    if not LocalPlayer():CanCraftItem(self.ItemClass, self.RecipeCategory) then
        self.Craft:SetDisabled(true)
    end
end

function PANEL:CraftItem()
	local tab = {
        Class = self.ItemClass,
        Type = self.RecipeCategory
	}

	netstream.Send("CraftNormalRecipeItem", tab)
end

function PANEL:Paint(w, h)
	local colors = GAMEMODE:GetConfig("UIColors")

	if self._Alt then
		surface.SetDrawColor(ColorAlpha(colors.Border, 130))
		surface.DrawRect(0, 0, w, h)
	end
end

vgui.Register("eternity_craftingpanel", PANEL, "eternity_panel")