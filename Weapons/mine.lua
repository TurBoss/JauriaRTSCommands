local weaponName="mine"

local weaponDef={
	name="mine",
	
	weaponType=[[MissileLauncher]],
	
	InterceptedByShieldType= 4,
	
	Accuracy=50,
	movingAccuracy=50,
	
	--Physic/flight path
	
	range=1100,
	reloadtime=12,
	weaponVelocity=500,
	startVelocity=300,
	weaponAcceleration=50,
	tolerance=16000,
	Turnrate=16000,
	collideFriendly=true,
	
	----APPEARANCE
	
	model="mine.dae",
	smokeTrail=false,
	explosionGenerator			= [[custom:genericshellexplosion-medium-red]],
	
	----TARGETING
	
	----DAMAGE
	
	damage={
		default = 800,
	},
	areaOfEffect=150,
	craterMult=100,
	--?FIXME***
	
	lineOfSight=true,
	
	--sound
	
	soundHit="mine1",
}

return lowerkeys ({[weaponName]=weaponDef})
