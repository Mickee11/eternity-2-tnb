CLASS = class.Create()

CLASS.Name 	= ""

CLASS.Limited = false

function CLASS:OnFired(ply, weapon, cone)
	weapon:EmitSound(weapon.FireSound)
end

class.Register("base_gameammo", CLASS)