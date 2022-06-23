function GM:EternityPostLoadAmmo()
    self:RegisterAmmo(includes.CurrentFolder(1) .. "classes/gameammo/gameammo_beanbag.lua")
	self:RegisterAmmoFolder("classes/gameammo/beanbag")
    self:RegisterAmmoFolder("classes/gameammo/ballistic")
end
