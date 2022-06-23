ITEM = class.Create("base_item")

ITEM.Name 				= "%s Ration"
ITEM.Description 		= "A small package containing a selection of basic living supplies."

ITEM.Model 				= Model("models/weapons/w_package.mdl")

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.ItemGroup 			= "Ration"
ITEM.Sealed             = false

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

ITEM.Contents 			= {
    "xenian_zombie_fast",
}

ITEM.Money 				= 5

function ITEM:GetName()
    return self.Name
    --return string.format(self.Name, self.Sealed and "Sealed" or "Unsealed")
end

function ITEM:CreateInventory()
    -- self.Sealed = true
    -- Don't seal things until crafting is added.
    -- TODO: Add crafting.

    local inventory = GAMEMODE:GetInventory(self.Inventories.Main)

    if self.Money > 0 then
        local money = GAMEMODE:CreateItem("currency_credits")
        
        if self.Money > 1 then
            money:ProcessArguments(self.Money)
        end

        local ok, flipped, x, y = inventory:FindItemFit(money)

        if not ok then
            return
        end

        if flipped then
            money.Flipped = not money.Flipped
        end

        inventory:AddItem(money, x, y)
    end

    for _,v in pairs(self.Contents) do
        local item = GAMEMODE:CreateItem(v)

        if not item then
            return
        end

        local ok, flipped, x, y = inventory:FindItemFit(item)

        if not ok then
            return
        end

        if flipped then
            item.Flipped = not item.Flipped
        end

        inventory:AddItem(item, x, y) 
    end
end

function ITEM:GetOptions(ply)
	local tab = {}

    if self.Sealed then
        table.insert(tab, {
            Name = "Unseal",
            Callback = function()
                ply:SendChat("NOTICE", "You release the ration's seal, revealing the contents within.")

                self.Sealed = false
            end,
            Client = function()
				GAMEMODE:OpenGUI("InventoryPopup", self:GetName(), self.Inventories)
			end
        })

        if self:CanDrop(ply) then
            table.insert(tab, {
                Name = "Drop",
                Callback = function()
                    local inventory = self:GetInventory()
    
                    inventory:RemoveItem(self)
    
                    GAMEMODE:WriteLog("item_drop", {
                        Ply = GAMEMODE:LogPlayer(ply),
                        Char = GAMEMODE:LogCharacter(ply),
                        Item = GAMEMODE:LogItem(self)
                    })
    
                    local item = self:SetWorldItem(ply:GetItemDropLocation(), Angle())
    
                    if item ~= nil then
                        item.DropID = ply:SteamID()
                        item.DropCharacter = ply:CharID()
                    else
                        ply:SendChat("ERROR", "That custom item has an invalid physics model!")
                    end
                end
            })
        end

        if self:CanDestroy(ply) then
            table.insert(tab, {
                Name = "Destroy",
                Client = function()
                    return GAMEMODE:OpenGUI("Input", "confirm", "Item Confirmation", {
                        ButtonText = string.format("Destroy %s", self:GetName())
                    })
                end,
                Callback = function(val)
                    if not val then
                        return
                    end
                    
                    GAMEMODE:WriteLog("item_destroy", {
                        Ply = GAMEMODE:LogPlayer(ply),
                        Char = GAMEMODE:LogCharacter(ply),
                        Item = GAMEMODE:LogItem(self)
                    })
    
                    ply:VisibleMessage(string.format("%s destroys their %s", ply:VisibleRPName(), string.lower(self:GetName())))
    
                    GAMEMODE:DeleteItem(self)
                end
            })
        end
    else
        for _, v in pairs(self:ParentCall("GetOptions", ply)) do
            table.insert(tab, v)
        end
    end

	return tab
end

return ITEM
