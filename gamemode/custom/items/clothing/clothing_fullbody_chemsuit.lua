ITEM = class.Create("base_clothing")

ITEM.Name 				= "CBRN Protection Suit"
ITEM.Description 		= "A grey chemical suit. Good for protecting one's body from the harmful world around."

ITEM.Model 				= Model("models/Items/item_item_crate.mdl")
ITEM.Skin 				= 1

ITEM.Width 				= 3
ITEM.Height 			= 3

ITEM.ArmorOverride      = true
ITEM.ArmorLevel 		= ARMOR_BASIC

ITEM.EquipmentSlots 	= {EQUIPMENT_TORSO}

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice 			= 2750
ITEM.SellPrice 			= 400

ITEM.ItemGroup 			= "Clothing"

ITEM.Inventories 		= {
	["Main"] = {2, 2}
}

ITEM.Filtered 			= true

if SERVER then
    function ITEM:SetupHands(ply, ent)
        ent:SetModel("models/weapons/c_arms_hev.mdl")
        ent:SetSkin(0)
        ent:SetBodyGroups("00000000")
    
        return true
    end
    
    function ITEM:PostModelData(ply, old)
        local model = "models/body_chemsuit.mdl"

        if GAMEMODE:GetModelGender(ply:CharModel()) == GENDER_FEMALE then
            model = "models/female_body_chemsuit.mdl"
        end

        return { 
            _base = {
                Model = old._base.Model,
                Material = "null"
            },
            torso = {
                Model = Model(model)
            }
        }
    end
end

return ITEM
