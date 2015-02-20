local weaponName="irsis2"

local weaponDef={
	name="Ball",
	weaponType=[[MissileLauncher]],

	Accuracy=10,
	movingAccuracy=10,
	
	InterceptedByShieldType= 4,
	
	--paralyzer = true,
	--paralyzeTime = 2,
	
	--Physic/flight path
	range=1500,
	reloadtime=10,
	weaponVelocity=500,
	startVelocity=150,
	weaponAcceleration=250,
	flightTime=5,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.0,
	dance=0,
	wobble=0,
	tolerance=3000,
	tracks=true,
	Turnrate=16000,
	collideFriendly=false,
	commandfire = true,
	----APPEARANCE
	
	model="irsisball.dae",
	--smokeTrail=true,
	--explosionGenerator="custom:genericshellexplosion-small-lightning",
	--CegTag="light1",

	----TARGETING
	
	turret=true,
	CylinderTargeting=true,
	avoidFeature=false,
	avoidFriendly=false,
	

	--commandfire=true,

	----DAMAGE
	
	damage={
		default=700,
	},
	areaOfEffect=100,
	craterMult=0,
	
	--?FIXME***
	
	lineOfSight=true,


	--sound
	
	--soundStart		=	"kortus2",
	--soundHit		=	"kortus3",
}

return lowerkeys ({[weaponName]=weaponDef})
