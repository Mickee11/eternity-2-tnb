AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Machete"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_machete.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_machete.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 50

SWEP.Animations = {
	idle = "idle01",
	hit = {"hitcenter1", "hitcenter2", "hitcenter3"},
	miss = {"misscenter1", "misscenter2"}
}
