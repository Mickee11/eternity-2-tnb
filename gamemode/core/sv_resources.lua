local workshop = GM:GetConfig("Workshop")

for _, id in pairs(workshop.Content) do
	resource.AddWorkshop(id)
end

local mapID = workshop.Maps[game.GetMap()]

if mapID then
	if istable(mapID) then
		for _, id in pairs(mapID) do
			resource.AddWorkshop(id)
		end
	else
		resource.AddWorkshop(mapID)
	end
else
	resource.AddSingleFile("maps/" .. game.GetMap() .. ".bsp")
end