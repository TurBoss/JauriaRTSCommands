local unitName = "carson"

local unitDef = {
	name			= "Carson",
	Description		= "Complex, mobile unit.",
	objectName		= "carson.dae",
	script			= "carson.lua",
	buildPic		= "carson.png",
	--iconType		= "rk2",

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
	Acceleration = 0.2,
	BrakeRate = 0.03,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.4,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 900,

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

	sfxtypes = {
		explosiongenerators = {
			"custom:WARMUZZLE",
			"custom:DEVA_SHELLS",
		},
	}, 


	weapons = {
		[1]={name  = "NOWEAPON",
			--onlyTargetCategory = [[LAND]],
			--maxAngleDif = 210,
			--mainDir = [[0 0 1]],
		},
		[2]={name  = "carson2",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		--[2]={name  = "shieldheik",
		--},
	},
}

return lowerkeys({ [unitName] = unitDef })
