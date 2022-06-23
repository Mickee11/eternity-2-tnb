local meta = FindMetaTable("Player")

function meta:CanCraftItem(class, category)
    local recipe = CRAFTING[category].Recipes[class]

    if not recipe then
        return false
    end

    for k,v in SortedPairs(recipe) do
        if k == "Returns" or v < 1 then
            continue
        end

        if not self:HasItem(k, v) then
            return false
        end
    end

    return true
end

if SERVER then
    netstream.Hook("CraftNormalRecipeItem", function(ply, data)
        if not ply:CanCraftItem(data.Class, data.Type) then
            return
        end

        local recipe = CRAFTING[data.Type].Recipes[data.Class]

        for k,v in SortedPairs(recipe) do
            if k == "Returns" or v < 1 then
                continue
            end

            ply:TakeItem(k, v)
        end

        local crafted = class.Get(data.Class)

        if crafted then
            ply:GiveItem(data.Class)
        end

        local item = class.Get(data.Class)

        if recipe.Returns then
            for k,v in SortedPairs(recipe.Returns) do
                item = class.Get(k)

                if not item or v < 1 then
                    return
                end

                ply:GiveItem(k, v)
            end
        end
    end)
end