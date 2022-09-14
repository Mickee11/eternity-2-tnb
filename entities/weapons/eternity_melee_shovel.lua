AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Shovel"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_shovel.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_shovel.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 30

SWEP.Delay 				= 0.7

SWEP.Animations = {
	idle = "idle",
	hit = "swing_e_w",
	miss = "swing_w_e"
}
