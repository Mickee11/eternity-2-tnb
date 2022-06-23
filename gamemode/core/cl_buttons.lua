hook.Add("PostDrawTranslucentRenderables", "buttons.PostDrawTranslucentRenderables", function(depth, skybox)
	if skybox then
		return
	end

	if not LocalPlayer():IsInEditMode() then
		return
	end

	for _, v in pairs(GAMEMODE.Buttons) do
		if not IsValid(v) or v:IsDormant() then
			continue
		end

		local color = v:ButtonDisabled() and Color(255, 0, 0) or color_white

		render.SetColorMaterial()
		render.DrawBox(v:GetPos(), v:GetAngles(), v:OBBMins() - Vector(0.1, 0.1, 0.1), v:OBBMaxs() + Vector(0.1, 0.1, 0.1), ColorAlpha(color, 50), true)
	end
end)