
local weaponName = "carson2"

local weaponDef = {
	
	name                    = "MassiveBurst",
	weaponType              = "LaserCannon",
	
	Accuracy=100,
	movingAccuracy=150,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 20,
	},
--	areaOfEffect            = 10,
	
	--physics
	
	commandfire = true,
	
	weaponVelocity          = 880,
	reloadtime              = 20,
	range                   = 500,
	sprayAngle              = 100,
	weaponaceleration       = 860,
	tolerance               = 3000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
	burst                   = 60,
	burstrate               = 0.1,
	proyectiles             = 1,
	
	--apperance
	
	duration                = 0.005,
	thickness               = 0.8,
	rgbColor                = [[1 1 0]],
	--size                    = 0,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 0,
	
	--sounds
	
	soundStart              = "carson2",
	
	collideFriendly=true,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
