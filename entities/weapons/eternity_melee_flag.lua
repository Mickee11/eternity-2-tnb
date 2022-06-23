AddCSLuaFile()
DEFINE_BASECLASS("eternity_melee_base")

SWEP.Base 				= "eternity_melee_base"

SWEP.PrintName 			= "United States Flag"
SWEP.Author 			= "TankNut"

SWEP.ViewModel 			= Model("models/tnb/weapons/c_flag.mdl")
SWEP.WorldModel 		= Model("models/tnb/weapons/w_flag.mdl")

SWEP.HoldType 			= "melee2"
SWEP.HoldTypeLowered 	= "normal"

SWEP.Damage 			= 30

SWEP.Delay 				= 0.7

SWEP.LoweredOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 0, -30)
}

SWEP.DefaultOffset 	= {
	ang = Angle(0, 0, 0),
	pos = Vector(0, 10, -10)
}

SWEP.Animations = {
	idle = "idle01",
	hit = "hitkill1",
	miss = "misscenter1"
}
