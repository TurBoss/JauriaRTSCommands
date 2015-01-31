local unitName = "cberserker"

local unitDef = {
	name = "Berserker",
	Description = "Heavy Infantry",
	objectName = "berserker.dae",
	script = "berserker.lua",
	buildPic = "placeholder.png",
	iconType = "berserker",

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
	BrakeRate = 0.03,
	FootprintX = 1,
	FootprintZ = 1,
	MaxSlope = 12,
	MaxVelocity = 1.05,
	MaxWaterDepth = 20,
	MovementClass = "Default1x1",
	TurnRate = 880,

	sightDistance = 420,

	Category = [[LAND]],
	
	CanManualFire = true,
	CanAttack = true,
	CanGuard = true,
	CanMove = true,
	CanPatrol = true,
	CanStop = true,
	LeaveTracks = false,


	--[[sfxtypes = {
		explosiongenerators = {
			"custom:smoke2",
		},
	},--]]


	weapons = {
		[1]={name  = "pistola",
			onlyTargetCategory = [[LAND]],
		},
		[3]={name  = "lanzamisiles",
			onlyTargetCategory = [[LAND]],
		},
	},
}

return lowerkeys({ [unitName] = unitDef })
