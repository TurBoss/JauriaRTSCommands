local unitName = "heikthief"

local unitDef = {
	name			= "Heikthief",
	Description		= "Complex, mobile unit.",
	objectName		= "heikthief.dae",
	script			= "heikthief.lua",
	buildPic		= "heikthief.png",
	iconType		= "mn1",

	--cost

	buildCostMetal = 0,
	buildCostEnergy = 0,
	buildTime = 0,

	--Health

	maxDamage = 10000,
	idleAutoHeal = 0,
	idleTime     = 0,

	--Movement

	moveState = 0,
	mass=450,
	Acceleration = 0.15,
	BrakeRate = 0.08,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.2,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 1000,

	sightDistance = 2000,

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
	
	Builder = true,
	ShowNanoSpray = false,
	CanBeAssisted = false,
	CanReclaim = false,
	CanRepair = false,
	CanAssist = false,
	CanRestore = false,
	workerTime = 0.50,
	--repairSpeed = 1,
	--reclaimSpeed = 1,
	buildDistance = 30,
	
	buildoptions = {
		"mine",
	},

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
