local unitName = "franco"

local unitDef = {
	name = "franco",
	Description = "Complex, mobile unit.",
	objectName = "franco.dae",
	script = "franco.lua",
	buildPic = "placeholder.png",
	--iconType = "rk2",

	--cost

	buildCostMetal = 100,
	buildCostEnergy = 0,
	buildTime = 2,

	--Health

	maxDamage = 3000,
	idleAutoHeal = 5,
	idleTime     = 3,

	--Movement

	moveState = 0,
	mass=500,
	Acceleration = 0.15,
	BrakeRate = 0.04,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 0.85,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 800,

	sightDistance = 340,

	Category = [[LAND]],
	CanManualFire = true, 
	CanAttack = true,
	CanGuard = true,
	CanMove = true,
	CanPatrol = true,
	CanStop = true,
	LeaveTracks = false, 


	weapons = {
		[1]={name  = "pistola",
			onlyTargetCategory = [[LAND]],
		},
		[3]={name  = "riflefranco",
			onlyTargetCategory = [[LAND]],
		},
		--[2]={name  = "shieldheik",
		--},
	},
}

return lowerkeys({ [unitName] = unitDef })
