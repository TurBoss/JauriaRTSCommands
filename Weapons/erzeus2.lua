
local weaponName = "erzeus2"

local weaponDef = {
	
	name                    = "DestroyImpact",
	weaponType              = "LaserCannon",
	
	Accuracy=10,
	movingAccuracy=30,
	
	commandfire = true,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 1000,
	},
--	areaOfEffect            = 10,
	
	--physics

	weaponVelocity          = 2300,
	reloadtime              = 10,
	range                   = 1000,
--	sprayAngle              = 45,
	weaponacceleration       = 850,
	tolerance               = 100,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
--	burst                   = 2,
--	burstrate               = 0.08,
	--projectiles             = 2,
	
	--apperance
	
	duration                = 0.02,
	thickness               = 0.6,
	rgbColor                = [[0.5 0 0.5]],
	--size                    = 0,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 0,
	
	--sounds
	
	soundStart              = "erzeus2",
	
	collideFriendly=false,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
