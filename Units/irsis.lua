local unitName = "irsis"

local unitDef = {
	name = "Irsis",
	Description = "Complex, mobile unit.",
	objectName = "irsis.dae",
	script = "irsis.lua",
	buildPic = "irsis.png",
	--iconType = "rk2",

	--cost

	buildCostMetal = 0,
	buildCostEnergy = 0,
	buildTime = 0,

	--Health

	maxDamage = 1000,
	idleAutoHeal = 0,
	idleTime     = 0,

	--Movement
	
	moveState = 0,
	mass=1000,
	Acceleration = 0.25,
	BrakeRate = 0.035,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.5,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 950,

	sightDistance = 2000,

	Category = [[LAND]],
	CanManualFire = true, 
	CanAttack = true,
	CanGuard = true,
	CanMove = true,
	CanPatrol = true,
	CanStop = true,
	LeaveTracks = false,
	UpRight = true,

	--sfxtypes = {
		--explosiongenerators = {
			--"custom:WARMUZZLE",
			--"custom:DEVA_SHELLS",
		--},
	--}, 


	weapons = {
		[1]={name  = "irsis1",
		},
		[2]={name  = "irsis2",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
	},
}

return lowerkeys({ [unitName] = unitDef })
