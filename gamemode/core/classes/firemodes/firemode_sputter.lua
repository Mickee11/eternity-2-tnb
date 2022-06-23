FIREMODE = class.Create("firemode_semi")

FIREMODE.Name 		= "Automatic"

FIREMODE.Automatic 	= true

function FIREMODE:GetDelay()
	local min = self:Get("DelayMin")
	local max = self:Get("DelayMax")

	return math.Rand(min, max)
end

return FIREMODE
