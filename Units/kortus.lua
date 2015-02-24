local unitName = "kortus"

local unitDef = {
	name			= "Kortus",
	Description		= "Complex, mobile unit.",
	objectName		= "kortus.dae",
	script			= "kortus.lua",
	buildPic		= "kortus.png",
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
	
	
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeScales = [[15 30 15]],
	collisionVolumeType = [[cylY]],
	
	--usepiececollisionvolumes = true,
	
	moveState = 0,
	mass=1000,
	Acceleration = 0.4,
	BrakeRate = 0.05,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.6,
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
			[[custom:RIOT_SHELL_S]],
			[[custom:HEAVY_CANNON_MUZZLE]],
		},
	}, 


	weapons = {
		[1]={name  = "kortus1",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		[2]={name  = "kortus2",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
		--[2]={name  = "shieldheik",
		--},
	},
}

return lowerkeys({ [unitName] = unitDef })
