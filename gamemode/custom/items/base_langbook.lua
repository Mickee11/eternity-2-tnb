ITEM = class.Create("base_item")

ITEM.Name 				= "%s Language Glossary"
ITEM.Description 		= "A handy guide to understanding the %s language. Relatively legal."

ITEM.Model 				= Model("models/gibs/shield_scanner_gib1.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.Language           = LANG_ENG

ITEM.License 			= LICENSE_MISCGOODS
ITEM.UnitPrice 			= 500
ITEM.SellPrice 			= 100

function ITEM:GetName()
    return string.format(self.Name, LANGUAGES[self.Language].Name)
end

function ITEM:GetDescription()
    return string.format(self.Description, LANGUAGES[self.Language].Name)
end

return ITEM 