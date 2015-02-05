local unitName = "startflag"

local unitDef = {
	name = "startflag",
	Description = "",
	objectName = "startflag.dae",
	script = "startflag.lua",
	buildPic = "placeholder.png",
	--iconType = "rk2",

	--cost

	buildCostMetal = 85,
	buildCostEnergy = 0,
	buildTime = 4.25,

	--Health

	HideDamage		= 1,
	maxDamage		= 250000,
	idleAutoHeal	= 1000,
	idleTime		= 0,

	--Movement
	
	moveState = 0,
	mass=10000,
	Acceleration = 0,
	BrakeRate = 0,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 0,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 0,
	YardMap =" o ",

	sightDistance = 340,

	Category = [[LAND]],
	CanAttack = false,
	CanGuard = false,
	CanMove = false,
	CanPatrol = false,
	CanStop = false,
	LeaveTracks = false,
	noAutoFire = false,

}

return lowerkeys({ [unitName] = unitDef })
