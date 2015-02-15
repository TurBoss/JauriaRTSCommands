
local weaponName = "shootgun"

local weaponDef = {
	
	name                    = "shootgun",
	weaponType              = "LaserCannon",
	
	Accuracy=100,
	movingAccuracy=150,
	areaOfEffect = 32,
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 200,
	},
--	areaOfEffect            = 10,
	
	--physics
	
	commandfire = true,
	
	weaponVelocity          = 880,
	reloadtime              = 10,
	range                   = 500,
	sprayAngle              = 1500,
	weaponaceleration       = 860,
	tolerance               = 3000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
	burst                   = 6,
	burstrate               = 0.001,
	proyectiles             = 3,
	
	--apperance
	
	duration                = 0.005,
	thickness               = 0.8,
	rgbColor                = [[1 1 0]],
	--size                    = 0,
	--stages                  = 0,
	intensity               = 1,
	--separation              = 0,
	
	--sounds
	
	--soundStart              = "laser_gfx",
	
	collideFriendly=true,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
