
local weaponName = "erzeus1"

local weaponDef = {
	
	name                    = "FastShot",
	weaponType              = "LaserCannon",
	
	Accuracy=10,
	movingAccuracy=30,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 300,
	},
--	areaOfEffect            = 10,
	
	--physics
	
	weaponVelocity          = 800,
	reloadtime              = 8,
	range                   = 220,
--	sprayAngle              = 45,
	weaponaceleration       = 450,
	tolerance               = 3000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 100,
--	burst                   = 2,
--	burstrate               = 0.08,
	--proyectiles             = 2,
	
	--apperance
	
	duration                = 0.005,
	thickness               = 0.8,
	rgbColor                = [[1 1 0]],
	--size                    = 0,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 0,
	--sounds
	
	soundStart              = "erzeus1",
	
	collideFriendly=true,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
