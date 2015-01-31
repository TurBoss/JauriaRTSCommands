local weaponName="dguntest"

local weaponDef={
	name="dguntest",
	weaponType=[[MissileLauncher]],

	Accuracy=420,
	movingAccuracy=700,
	
	InterceptedByShieldType= 4,
	
	--Physic/flight path
	range=460,
	reloadtime=4.1,
	weaponVelocity=1100,
	startVelocity=600,
	weaponAcceleration=480,
	flightTime=6,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.4,
	dance=0,
	wobble=0,
	tolerance=16000,
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
