local weaponName="mina"

local weaponDef={
	name="mina",
	
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
	
	model="mina.dae",
	smokeTrail=false,
	explosionGenerator			= [[custom:genericshellexplosion-medium-red]],
	
	----TARGETING
	
	----DAMAGE
	
	damage={
		default = 1780,
		heavyarmor = 2130,
		lightarmor = 2680,
		torrearmor = 3450,
	},
	areaOfEffect=210,
	craterMult=0,
	--?FIXME***
	
	lineOfSight=true,
	
	--sound
	
	soundHit="boom_gfx",
	soundStart = "misil_gfx",
}

return lowerkeys ({[weaponName]=weaponDef})
