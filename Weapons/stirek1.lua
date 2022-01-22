
local weaponName = "stirek1"

local weaponDef = {
	
	name                    = "SMG",
	weaponType              = "LaserCannon",
	
	Accuracy=10,
	movingAccuracy=30,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 25,
	},
--	areaOfEffect            = 10,
	
	--physics
	
	weaponVelocity          = 880,
	reloadtime              = 3,
	range                   = 300,
--	sprayAngle              = 45,
	weaponacceleration       = 860,
	tolerance               = 3000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
	burst                   = 3,
	burstrate               = 0.065,
	projectiles             = 1,
	
	--apperance
	
	duration                = 0.005,
	thickness               = 0.8,
	rgbColor                = [[1 1 0]],
	--size                    = 0,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 0,
	
	--sounds
	
	soundStart              = "stirek1",
	
	collideFriendly=true,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
