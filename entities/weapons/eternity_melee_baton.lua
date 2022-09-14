AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Baton"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_baton.mdl")
SWEP.WorldModel 		= Model("models/worldmodels/w_mw2019_baton_wm.mdl")

SWEP.HoldType 			= "melee"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 20

SWEP.Animations = {
	idle = "idle",
	hit = {"swing_ne_nw", "secondary_swing"},
	miss = {"swing_e_w", "swing_w_e"}
}
