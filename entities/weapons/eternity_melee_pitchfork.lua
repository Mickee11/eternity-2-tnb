AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Pitchfork"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_pitchfork.mdl")
SWEP.WorldModel 		= Model("")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 25

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_e_nw_"},
	miss = {"swing_s_w_01", "swing_w_e"}
}
