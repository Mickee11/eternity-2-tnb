AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Golf Club"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_golfclub.mdl")
SWEP.WorldModel 		= Model("")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 34

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_e_w", "swing_w_e"},
	miss = {"swing_e_w"}
}