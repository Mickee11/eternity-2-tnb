AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Machete"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_machete.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_machete.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 50

SWEP.Animations = {
	idle = "idle",
	hit = {"strong_swing", "swing_e_w"},
	miss = {"swing_w_e"}
}
