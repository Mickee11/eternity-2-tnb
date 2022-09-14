AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Sledgehammer"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_sledgehammer.mdl")
SWEP.WorldModel 		= Model("")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 50

SWEP.Delay 				= 0.7

SWEP.Animations = {
	idle = "idle",
	hit = "swing_e_w",
	miss = "swing_w_e"
}