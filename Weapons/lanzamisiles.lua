local weaponName="lanzamisiles"

local weaponDef={
	name="lanzamisiles",
	weaponType=[[MissileLauncher]],

	Accuracy=420,
	movingAccuracy=700,
	
	InterceptedByShieldType= 4,
	
	--Physic/flight path
	range=1000,
	reloadtime=10,
	weaponVelocity=1800,
	startVelocity=250,
	weaponAcceleration=280,
	flightTime=5,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.2,
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
	--CegTag="light1",

	----TARGETING
	
	turret=true,
	CylinderTargeting=true,
	avoidFeature=false,
	avoidFriendly=false,
	

	--commandfire=true,

	----DAMAGE
	
	damage={
		default=1220,
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
