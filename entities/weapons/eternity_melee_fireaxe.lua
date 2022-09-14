AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Fire Axe"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_fireaxe.mdl")
SWEP.WorldModel 		= Model("")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 28

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_e_w", "swing_se_w", "swing_w_e"},
	miss = {"swing_e_w"}
}
