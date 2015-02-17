
local weaponName = "shieldhaek"

local weaponDef = {
	
	name					= "shieldhaek",
	weaponType				= "Shield",
	
	damage = {
		default = 10,
	},
	texture1				= "shield4",
	
	exteriorShield			= true,
	shieldAlpha				= 0.2,
	shieldBadColor			= [[1 0.1 0.1]],
	shieldGoodColor			= [[0 0.2 1]],
	InterceptType			= 511,
	shieldInterceptType		= 511,
	shieldPower				= 950,
	shieldPowerRegen		= 38,
	shieldPowerRegenEnergy	= 0,
	shieldRadius			= 68,
	shieldRepulser			= false,
	--shieldforce				= 10000,
	--shieldmaxspeed			= 10000,
	shieldStartingPower		= 1350,
	smartShield				= true,
	visibleShield			= true,
	visibleShieldHitFrames	= 4,
	visibleShieldRepulse	= true,
	
}
return lowerkeys({[weaponName] = weaponDef})
