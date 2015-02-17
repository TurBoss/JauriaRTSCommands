local unitName = "stirek"

local unitDef = {
	name			= "Stirek",
	Description		= "Complex, mobile unit.",
	objectName		= "stirek.dae",
	script			= "stirek.lua",
	buildPic		= "stirek.png",
	--iconType		= "mn1",

	--cost

	buildCostMetal = 0,
	buildCostEnergy = 0,
	buildTime = 0,

	--Health

	maxDamage = 1000,
	idleAutoHeal = 0,
	idleTime     = 0,

	--Movement
	
	usepiececollisionvolumes = true,

	moveState = 0,
	mass=1000,
	Acceleration = 0.15,
	BrakeRate = 0.08,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.3,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 1000,

	sightDistance = 2000,

	CanCloak = true,
	MinCloakDistance = 150,
	InitCloaked = true,
	
	Category = [[LAND]],
	--CanManualFire = true, 
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
	
	sfxtypes = {
		explosiongenerators = {
			[[custom:emg_shells_l]],
			[[custom:flashmuzzle1]],
		},
	},
	
	weapons = {
		[1]={name  = "stirek1",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		[2]={name  = "NOWEAPON",
		},
		--[2]={name  = "shieldheik",
		--},
	},
}

return lowerkeys({ [unitName] = unitDef })
