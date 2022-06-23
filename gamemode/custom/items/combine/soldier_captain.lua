ITEM = class.Create("base_combine")

ITEM.Name 				= "Overwatch Captain P.C.V."
ITEM.Description 		= "A black and blue set of Powered Combat Armor for ground captains."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")

ITEM.Species 			= {SPECIES_CMB_SOLDIER}

ITEM.ArmorOverride		= true
ITEM.ArmorLevel			= ARMOR_ELITE

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
				Model = Model("models/tnb/halflife2/combine/combine_captain_hlvr_player.mdl"),
				Skin = self.Skin,
				Bodygroups = {
					Filter = 0,
					Reft_bag = 1,
					Left_bag = 1,
					Left_shin_pad = 0,
					Right_shin_pad = 0,
					Left_elbow_pad = 0,
					Right_elbow_pad = 0,
					Left_thigh_pad = 0,
					Right_thigh_pad = 0,
					Left_shoulder_armour = 0,
					Right_shoulder_armour = 0,
					Radio_backpack = 0
				},
                Materials = {
                    ["models/tnb/combine/combine_captain/combine_captain_body_gear"] = "models/tnb/combine/combine_captain/combine_captain_body_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_body_fabric"] = "models/tnb/combine/combine_captain/combine_captain_body_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_body_pad"] = "models/tnb/combine/combine_captain/combine_captain_body_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_helmet_off"] = "models/tnb/combine/combine_captain/combine_captain_helmet_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_helmet_m"] = "models/tnb/combine/combine_captain/combine_captain_helmet_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_helmet"] = "models/tnb/combine/combine_captain/combine_captain_helmet_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_helmet_c"] = "models/tnb/combine/combine_captain/combine_captain_helmet_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_legs_fabric"] = "models/tnb/combine/combine_captain/combine_captain_legs_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_legs_pad"] = "models/tnb/combine/combine_captain/combine_captain_legs_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_legs_gear"] = "models/tnb/combine/combine_captain/combine_captain_legs_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_legs_m"] = "models/tnb/combine/combine_captain/combine_captain_legs_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_radio_m"] = "models/tnb/combine/combine_captain/combine_captain_radio_dagger",
                    ["models/tnb/combine/combine_captain/combine_captain_radio_fabric"] = "models/tnb/combine/combine_captain/combine_captain_radio_dagger"
                }
			}
		}
	end
end
 
return ITEM