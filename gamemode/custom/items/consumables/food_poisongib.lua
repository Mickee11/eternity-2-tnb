ITEM = class.Create("base_consumable")

ITEM.Name 				= "Raw Poisonous Headcrab Heart"
ITEM.Description 		= "The off-color heart of a Poisonous Headcrab. You'll have to boil it to make it safe."

ITEM.Model 				= Model("models/xen/headcrab_gland.mdl")
ITEM.Skin               = 1
ITEM.Color				= Color(127, 255, 255)

ITEM.License 			= LICENSE_GREYMARKET
ITEM.UnitPrice 			= 10
ITEM.SellPrice 			= 5

ITEM.Height 			= 1

ITEM.UseSelf 			= true
ITEM.SelfString 		= "Eat"

if SERVER then
	function ITEM:OnSelfUse(ply)
        local dmg = DamageInfo()
        dmg:SetHealth(80)
        dmg:SetAttacker(ply)
        dmg:SetDamageType(DMG_NERVEGAS)
        ply:TakeDamageInfo(dmg)

        ply:TakeCDamage(80)

		GAMEMODE:DeleteItem(self)
	end
end

return ITEM