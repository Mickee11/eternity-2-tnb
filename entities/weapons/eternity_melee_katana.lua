AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Katana"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_katana.mdl")
SWEP.WorldModel 		= Model("")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 50

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_e_w", "swing_w_e"},
	miss = {"swing_e_w"}
}