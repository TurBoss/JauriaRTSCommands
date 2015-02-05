local unitName = "heikthief"

local unitDef = {
	name			= "Heikthief",
	Description		= "Complex, mobile unit.",
	objectName		= "heikthief.dae",
	script			= "heikthief.lua",
	buildPic		= "heikthief.png",
	iconType		= "mn1",

	--cost

	buildCostMetal = 85,
	buildCostEnergy = 0,
	buildTime = 4.25,

	--Health

	maxDamage = 980,
	idleAutoHeal = 14,
	idleTime     = 3,

	--Movement

	mass=600,
	Acceleration = 2,
	BrakeRate = 1.5,
	FootprintX = 1.5,
	FootprintZ = 1.5,
	MaxSlope = 12,
	MaxVelocity = 1,
	MaxWaterDepth = 20,
	MovementClass = "Default2x2",
	TurnRate = 1000,

	sightDistance = 340,

	CanCloak = true,
	MinCloakDistance = 150,
	InitCloaked = true,
	
	Category = [[LAND]],
	CanManualFire = true, 
	CanAttack = true,
	CanGuard = true,
	CanMove = true,
	CanPatrol = true,
	CanStop = true,
	LeaveTracks = false, 
	UpRight = true,


	weapons = {
		[1]={name  = "metralleta",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		[3]={name  = "dguntest",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		--[2]={name  = "shieldheik",
		--},
	},
}

return lowerkeys({ [unitName] = unitDef })
