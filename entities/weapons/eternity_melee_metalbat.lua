AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Metal Bat"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_metalbat.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_bat.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 25

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_e_w_03"},
	miss = {"swing_ne2sw_02", "swing_w_e_02"}
}
