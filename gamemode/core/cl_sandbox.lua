hook.Add("Think", "sandbox.Think", function()
	if GetConVar("physgun_wheelspeed"):GetFloat() > 20 then
		RunConsoleCommand("physgun_wheelspeed", "20")
	end
end)

hook.Add("PopulateEternityEntities", "CL.sandbox.PopulateEternityEntities", function(pnlContent, tree, node)
	local entities = scripted_ents.GetList()
	local categorized = {}
	
	for k,entity in pairs(entities) do
		entity = entity.t

        if not entity.Category or not string.StartWith(entity.Category, "Eternity.") then
            continue
        end

        local group = string.Split(entity.Category, ".")[2]

        if not group then
            group = "Uncategorized"
		end
		
        categorized[group] = categorized[group] or {}
        table.insert(categorized[group], entity)
    end	

    entities = nil

    for category,v in SortedPairs(categorized) do
        local node = tree:AddNode(category, "icon16/book.png")

        node.DoPopulate = function(listing)
            if listing.PropPanel then
                return
            end

            listing.PropPanel = vgui.Create("ContentContainer", pnlContent)
            listing.PropPanel:SetVisible(false)
            listing.PropPanel:SetTriggerSpawnlistChange(false)

            for k,entity in SortedPairsByMemberValue(v, "PrintName") do
                spawnmenu.CreateContentIcon("EternityEntityContentType", listing.PropPanel, {
                    nicename = entity.PrintName,
					spawnname = entity.ClassName
                })
            end
        end

        node.DoClick = function(listing)
            listing:DoPopulate()
            pnlContent:SwitchPanel(listing.PropPanel)
        end
    end
end)

spawnmenu.AddCreationTab("Eternity", function()
	local ctrl = vgui.Create("SpawnmenuContentPanel")
	ctrl:CallPopulateHook("PopulateEternityEntities")

	return ctrl
end, "icon16/book_addresses.png", 25)

spawnmenu.AddContentType("EternityEntityContentType", function(container, obj)
	if not obj.nicename then return end
	if not obj.spawnname then return end

	local icon = vgui.Create("ContentIcon", container)
	icon:SetContentType("EternityEntityContentType")
	
	icon:SetSpawnName(obj.spawnname)
	icon:SetName(obj.nicename)
	icon:SetAdminOnly(true)
	icon:SetColor(Color(0, 0, 0, 255))

	icon.DoClick = function()
		RunConsoleCommand("gm_spawnsent", obj.spawnname)
		surface.PlaySound("ui/buttonclickrelease.wav")
	end

	icon.OpenMenu = function()
		local menu = DermaMenu()

		menu:AddOption("#spawnmenu.menu.copy", function() 
			SetClipboardText(obj.spawnname) 
		end):SetIcon("icon16/page_copy.png")

		menu:AddOption("#spawnmenu.menu.spawn_with_toolgun", function() 
			RunConsoleCommand("gmod_tool", "creator") 
			RunConsoleCommand("creator_type", "0") 
			RunConsoleCommand("creator_name", obj.spawnname) 
		end):SetIcon("icon16/brick_add.png")

		menu:Open()
	end
	
	if IsValid(container) then
		container:Add(icon)
	end

	return icon
end)