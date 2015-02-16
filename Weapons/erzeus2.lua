
local weaponName = "erzeus2"

local weaponDef = {
	
	name                    = "Rifle",
	weaponType              = "LaserCannon",
	
	Accuracy=10,
	movingAccuracy=30,
	
	commandfire = true,
	
	--damage
	
	avoidFeature = false,
	
	damage = {
		default = 9000,
	},
--	areaOfEffect            = 10,
	
	--physics

	weaponVelocity          = 1500,
	reloadtime              = 12,
	range                   = 1200,
--	sprayAngle              = 45,
	weaponaceleration       = 850,
	tolerance               = 10000,
	lineOfSight             = true,
	turret                  = true,
	craterMult              = 0,
--	burst                   = 2,
--	burstrate               = 0.08,
	--proyectiles             = 2,
	
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
	
	collideFriendly=true,
	noSelfDamage= false,
}
return lowerkeys({[weaponName] = weaponDef})
