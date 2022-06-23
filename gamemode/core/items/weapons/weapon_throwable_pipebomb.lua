ITEM = class.Create("base_throwable")

ITEM.Name 				= "Improvised Explosive Device"
ITEM.Description 		= "A crude, but powerful explosive designed by Earth's survivors post-Judgement Day. Packed with explosive powder, this small pipe brings some serious punch to the table."
ITEM.OutlineColor		= Color(71, 161, 184)

ITEM.Model 				= Model("models/tnb/trpweapons/w_pipebomb.mdl")

ITEM.EquipmentSlots 	= {EQUIPMENT_MISC}

ITEM.MaxStack 			= 6

ITEM.WeaponClass 		= "eternity_throwable_pipebomb"

ITEM.Forward = 6
ITEM.Right = 3
ITEM.LobVelocity = 800

ITEM.License 			= LICENSE_BLACKMARKET
ITEM.UnitPrice          = 1500
ITEM.SellPrice          = 1000

return ITEM