AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Suitcase"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/halflife2/weapons/c_suitcase.mdl")
SWEP.WorldModel 		= Model("models/tnb/halflife2/weapons/w_suitcase.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Delay 				= 0.65

SWEP.LoweredOffset 	= {
	ang = Angle(5, 0, 0),
	pos = Vector(0, 0, -5)
}

SWEP.DefaultOffset 	= {
	ang = Angle(10, 0, 0),
	pos = Vector(0, 0, -5)
}

SWEP.Animations = {
    draw = "draw",
	idle = "idle",
	hit = {"hitcenter1", "hitcenter2", "hitcenter3"},
	miss = {"misscenter1", "misscenter2"}
}

function SWEP:Deploy()
	BaseClass.Deploy(self)
end

function SWEP:GetDamage()
    local inventory = self:GetItem():GetChildInventory("Main")

    if not inventory then
        return 10, DMG_CRUSH
    end

    local tiles = 0

    for _,v in pairs(inventory:GetItems()) do
        local classname = v:GetClassName()

        local item = class.Get(classname)

        if not item then
            continue
        end

        tiles = tiles + (item.Width * item.Height)
    end

	return 20 + (30 * (tiles / 6)), DMG_CRUSH
end

function SWEP:GetCDamage()
	return 0
end
