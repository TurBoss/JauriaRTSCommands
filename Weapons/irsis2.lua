local weaponName="irsis2"

local weaponDef={
	name="Ball",
	weaponType=[[MissileLauncher]],

	Accuracy=420,
	movingAccuracy=700,
	
	InterceptedByShieldType= 4,
	
	--paralyzer = true,
	--paralyzeTime = 2,
	
	--Physic/flight path
	range=800,
	reloadtime=5,
	weaponVelocity=200,
	startVelocity=50,
	weaponAcceleration=150,
	flightTime=5,
	BurnBlow=0,
	FixedLauncher=false,
	trajectoryHeight=0.0,
	dance=0,
	wobble=0,
	tolerance=3000,
	tracks=true,
	Turnrate=16000,
	collideFriendly=true,
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
		default=50000,
	},
	areaOfEffect=110,
	craterMult=0,
	
	--?FIXME***
	
	lineOfSight=true,


	--sound
	
	--soundStart		=	"kortus2",
	--soundHit		=	"kortus3",
}

return lowerkeys ({[weaponName]=weaponDef})
