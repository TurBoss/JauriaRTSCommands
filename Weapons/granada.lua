local weaponName="granada"

local weaponDef={
	name="granada",
	weaponType=[[MissileLauncher]],

	Accuracy=420,
	movingAccuracy=700,
	
	InterceptedByShieldType= 4,
	
	--Physic/flight path
	range=460,
	reloadtime=5,
	weaponVelocity=360,
	startVelocity=190,
	weaponAcceleration=220,
	flightTime=5,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.70,
	dance=0,
	wobble=0,
	tolerance=3000,
	tracks=false,
	Turnrate=16000,
	collideFriendly=true,
	commandfire = true,
	----APPEARANCE
	
	model="misil.dae",
	smokeTrail=true,
	--explosionGenerator="custom:explosion1",
	CegTag="light1",

	----TARGETING
	
	turret=true,
	CylinderTargeting=true,
	avoidFeature=false,
	avoidFriendly=false,
	

	--commandfire=true,

	----DAMAGE
	
	damage={
		default=1220,
		heavyarmor = 680,
		lightarmor = 980,
		torrearmor = 1150,
	},
	areaOfEffect=110,
	craterMult=0,
	
	--?FIXME***
	
	lineOfSight=true,


	--sound
	
	soundHit="boom_gfx",
	soundStart = "shoot_gfx",
}

return lowerkeys ({[weaponName]=weaponDef})
