local unitName = "erzeus"

local unitDef = {
	name			= "Erzeus",
	Description		= "Complex, mobile unit.",
	objectName		= "erzeus.dae",
	script			= "erzeus.lua",
	buildPic		= "erzeus.png",
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
	
	losEmitHeight = 3,
	--usepiececollisionvolumes = true,

	moveState = 0,
	mass=1000,
	Acceleration = 0.15,
	BrakeRate = 0.04,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 800,

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
			[[custom:WEAPEXP_PUFF]],
		},
	},

	weapons = {
		[1]={name  = "NOWEAPON",
			--onlyTargetCategory = [[LAND]],
			--maxAngleDif = 210,
			--mainDir = [[0 0 1]],
		},
		[2]={name  = "erzeus2",
			onlyTargetCategory = [[LAND]],
			maxAngleDif = 210,
			mainDir = [[0 0 1]],
		},
	},
}

return lowerkeys({ [unitName] = unitDef })
