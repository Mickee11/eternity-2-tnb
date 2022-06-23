ITEM = class.Create("base_xenian")

ITEM.Name 				= "Shield Bug"
ITEM.Description 		= "You've played Alien Swarm, right?"

ITEM.Model 				= Model("models/xen/pollip.mdl")

ITEM.Voicelines 	= {}

if SERVER then
	function ITEM:GetSpeeds(ply)
		return 60, 250, 250, 60
	end

	function ITEM:GetModelData(ply)
		return {
			_base = {
				Model = Model("models/aliens/shieldbug/shieldbug.mdl")
			}
		}
	end
end

return ITEM
