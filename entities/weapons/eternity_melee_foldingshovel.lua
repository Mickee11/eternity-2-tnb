AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "Folding Shovel"
SWEP.Author 			= "Mickee"

SWEP.ViewModel 			= Model("models/viewmodels/c_mw2019_etool.mdl")
SWEP.WorldModel 		= Model("models/worldmodels/w_mw2019_etool_wm.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 18

SWEP.Animations = {
	idle = "idle01",
	hit = {"strong_swing", "secondary_swing"},
	miss = {"swing_01", "swing_02"}
}
