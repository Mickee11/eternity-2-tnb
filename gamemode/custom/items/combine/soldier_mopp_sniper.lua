ITEM = class.Create("base_combine")

ITEM.Name 				= "Overwatch M.O.P.P. Camoflauge Gear"
ITEM.Description 		= "A set of special purpose gear for Overwatch snipers who operate in toxic environments.."


ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Species 			= {SPECIES_CMB_SOLDIER}

ITEM.ArmorOverride		= true
ITEM.ArmorLevel			= ARMOR_HEAVY

ITEM.Width 				= 2
ITEM.Height 			= 2

ITEM.Filtered 			= true

function ITEM:OnUnequip(ply, slot, unloading)
	ply:SetVISR(false)

	self:ParentCall("OnUnequip", ply, slot, unloading)
end

function ITEM:GetContextOptions(ply)
	local tab = {}

	table.insert(tab, {
		Name = "Toggle Overwatch NVG",
		Callback = function()
			ply:SetVISR(not ply:VISR())
		end
	})

	return tab
end

if SERVER then
	function ITEM:PostModelData(ply, data)
		return {
			_base = {
				Model = Model("models/tnb/halflife2/combine/combine_grunt_hlvr_player.mdl"),
				Bodygroups = {
					Grenade_attachment_1 = 1,
					Grenade_attachment_2 = 1,
					Grenade_1 = 1
                },
                Materials = {
                    ["models/tnb/combine/grunt/head_m"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/head"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/head_neckpiece"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/head_gib"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/head_bloody"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/head_bloody_m"] = "models/tnb/combine/grunt/head_javelin",
                    ["models/tnb/combine/grunt/body"] = "models/tnb/combine/grunt/body_javelin",
                    ["models/tnb/combine/grunt/body_suit"] = "models/tnb/combine/grunt/body_javelin",
                    ["models/tnb/combine/grunt/body_m"] = "models/tnb/combine/grunt/body_javelin",
                    ["models/tnb/combine/grunt/backpack_plate"] = "models/tnb/combine/grunt/body_javelin"
                }
			}
		}
	end
end
 
return ITEM