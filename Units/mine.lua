local unitName = "mine"

local unitDef = {

	Category = "LAND",
	name = "Mine",
	Description = "",
	objectName = "mine.dae",
	script = "mine.lua",
	buildPic = "mine.png",
	--iconType = "rk2",

	--cost

	buildCostMetal = 0,
	buildCostEnergy = 0,
	buildTime = 4.25,
	reclaimable = false,

	--Health

	maxDamage = 980,
	idleAutoHeal = 14,
	idleTime     = 3,

	Kamikaze = true,
	KamikazeDistance = 100,
	selfDestructAs = "mine",
	explodeAs = "mine",
	selfDestructCountdown = 0,

	--Movement
	
	moveState = 0,
	mass=600,
	Acceleration = 0,
	BrakeRate = 0,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 0,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 0,

	sightDistance = 340,

	Category = [[LAND]],
	CanAttack = false,
	CanGuard = false,
	CanMove = false,
	CanPatrol = false,
	CanStop = false,
	LeaveTracks = false,
	noAutoFire = false,

	CanCloak = true,
	MinCloakDistance = 150,
	InitCloaked = true,
	stealth = true,



	weapons = {
	
	},
}

return lowerkeys({ [unitName] = unitDef })
