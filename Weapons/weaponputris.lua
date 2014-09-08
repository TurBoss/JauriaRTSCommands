
local weaponName = "weaponputris"

local weaponDef = {
	
	name                    = "Mortero Putrido",
	weaponType              = "Cannon",
	
	Accuracy=20,
	movingAccuracy=60,
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 1250,
		heavyarmor = 460,
		lightarmor = 980,
		torrearmor = 200,
	},
	areaOfEffect            = 240,
	
	--physics
	myGravity               = 4.3,
	weaponVelocity          = 1340,
	startVelocity           = 500,
	reloadtime              = 12,
	range                   = 630,
	sprayAngle              = 180,
	weaponaceleration       = 600,
	tolerance               = 8000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0.0,
	highTrajectory          = 0,
	--burst                   = 5,
	--burstrate               = 0.5,
	--proyectiles             = 2,
	
	--apperance
	
	rgbColor                = [[0.11 0.9 0.07]],
	size                    = 17,
	stages                  = 3,
	intensity               = 0.5,
	separation              = 0.3,
	
	--sounds
	
	soundStart              = "disparo_gfx",
	
		--CegTag						= [[genericshellexplosion-large-sparks-burn]],
		explosionGenerator			= [[custom:areaputris]],
	
	collideFriendly=true,
}
return lowerkeys({[weaponName] = weaponDef})
