console.AddCommand("rp_setcid", function(ply, cid)
	if not ply:HasCharacter() then
		return
	end

    local cid = tonumber(cid) -- Because safety?

    if cid < 1 or cid > 99999 then
        Feedback(ply, "Number must be between 1 and 99999 inclusive.", "ERROR")

        return
    end

    ply:SetCitizenNumber(cid)
end, COMMAND_ALL, {CTYPE_NUMBER}, {},
"Character", "Allows you to change your default, generated citizen identity number.")