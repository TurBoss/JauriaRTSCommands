local unitName = "dumper"

local unitDef = {
	name = "Dumper",
	Description = "Simple, recolector",
	objectName = "dumper.dae",
	script = "dumper.lua",
	buildPic = "placeholder.png",

	--cost

	buildCostMetal = 320,
	buildCostEnergy = 0,
	buildTime = 10,

	--Health

	maxDamage    = 3200,
	idleAutoHeal = 20,
	idleTime     = 3,
	--Movement

	mass=1800,
	Acceleration =0.8,
	BrakeRate = 0.5,
	FootprintX = 3,
	FootprintZ = 3,
	MaxVelocity = 3.2,
	MaxWaterDepth = 20,
	MovementClass = "Default3x3",
	TurnRate = 1000,

	sightDistance = 400,

	Category = [[LAND]],

	CanAttack = false,
	CanGuard = true,
	CanMove = true,
	CanPatrol = true,
	CanStop = true,
	LeaveTracks = false, 

	--building

	Builder = true,
	ShowNanoSpray = true,
	CanBeAssisted = true,  
	workerTime = 0.1,
	repairSpeed = 0,
	reclaimSpeed = 30,
	buildDistance = 100,
}

return lowerkeys({ [unitName] = unitDef })
