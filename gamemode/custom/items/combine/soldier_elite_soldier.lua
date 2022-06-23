ITEM = class.Create("base_combine")

ITEM.Name 				= "Overwatch Elite Soldier P.C.V."
ITEM.Description 		= "A advanced set of Powered Combat Armor for Overwatch elite soldiers."

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
				Model = Model("models/tnb/halflife2/combine/combine_soldier_redone.mdl"),
				Skin = 1,
				Scale = 1.025,
				Bodygroups = {
					Head = 1,
					Headset = 0,
					Helmetdecal = 0,
					Helmetfilters = 0,
					Bodyarmor = 1,
					Shoulderpads = 1,
					Handstraps = 1,
					Beltgear = 0,
					Legstraps = 1
				}
			}
		}
	end
end
 
return ITEM