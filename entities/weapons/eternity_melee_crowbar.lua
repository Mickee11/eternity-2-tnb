AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Crowbar"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_crowbar.mdl")
SWEP.WorldModel 		= Model("models/weapons/w_crowbar.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 24

SWEP.Animations = {
	idle = "idle",
	hit = {"attack_01", "attack_02", "attack_03"},
	miss = {"attack_01"}
}
