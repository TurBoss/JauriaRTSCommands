
local weaponName = "kortus1"

local weaponDef = {
	
	name                    = "Shootgun",
	weaponType              = "LaserCannon",
	
	Accuracy=100,
	movingAccuracy=150,
	
	--areaOfEffect = 32,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 15,
	},
	
	--physics
	
	--commandfire = true,
	
	weaponVelocity          = 780,
	reloadtime              = 5,
	range                   = 800,
	sprayAngle              = 500,
	weaponaceleration       = 860,
	tolerance               = 3000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
	burst                   = 2,
	burstrate               = 0.03,
	projectiles             = 8,
	--apperance
	
	duration                = 0.005,
	thickness               = 0.8,
	rgbColor                = [[1 0 0]],
	rgbColor2               = [[1 1 0]],
	size                    = 2.5,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 10,
	
	--sounds
	
	
	soundStart              = "kortus1",
	soundTrigger            = true,
	
	collideFriendly=false,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
