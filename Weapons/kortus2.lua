local weaponName="kortus2"

local weaponDef={
	name="Stun",
	weaponType=[[MissileLauncher]],

	Accuracy=80,
	movingAccuracy=120,
	
	InterceptedByShieldType= 4,
	
	paralyzer = true,
	paralyzeTime = 2,
	
	--Physic/flight path
	range=800,
	reloadtime=15,
	weaponVelocity=860,
	startVelocity=390,
	weaponAcceleration=620,
	flightTime=5,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.0,
	dance=0,
	wobble=0,
	tolerance=3000,
	tracks=false,
	Turnrate=16000,
	collideFriendly=true,
	commandfire = true,
	----APPEARANCE
	
	model="granade.dae",
	--smokeTrail=true,
	explosionGenerator="custom:genericshellexplosion-small-lightning",
	--CegTag="light1",

	----TARGETING
	
	turret=true,
	CylinderTargeting=true,
	avoidFeature=false,
	avoidFriendly=false,
	

	--commandfire=true,

	----DAMAGE
	
	damage={
		default=5000,
	},
	areaOfEffect=100,
	craterMult=0,
	
	--?FIXME***
	
	lineOfSight=true,


	--sound
	
	soundStart		=	"kortus2",
	soundHit		=	"kortus3",
}

return lowerkeys ({[weaponName]=weaponDef})
