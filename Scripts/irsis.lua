local brazod = piece('brazod');
local brazoi = piece('brazoi');
local cabeza = piece('cabeza');
local centro = piece('centro');
local cinturon = piece('cinturon');
local cuchilla1 = piece('cuchilla1');
local cuchilla2 = piece('cuchilla2');
local cuerpo = piece('cuerpo');
local falda = piece('falda');
local flare1 = piece('flare1');
local flare2 = piece('flare2');
local hombrod = piece('hombrod');
local hombroi = piece('hombroi');
local manod = piece('manod');
local manoi = piece('manoi');
local root = piece('root');

local SIG_AIM = 1
local SIG_AIM1 = 2

local wheel_speed = math.rad(300)

function script.Create()
	Spin(cuchilla1, y_axis, wheel_speed)
	Spin(cuchilla2, z_axis, wheel_speed)
	
end

function script.StartMoving(heading)
	Turn(cinturon, z_axis, heading, math.rad(200))
end

function script.StopMoving()
end

function script.Shot(num)
end

function script.AimFromWeapon()
	return centro
end

function script.QueryWeapon() 
	return flare2
end
--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed

function script.AimWeapon(num, heading, pitch )
	--make sure the aiming animation is only run once
	if num == 1 then
		Signal(SIG_AIM)
		SetSignalMask(SIG_AIM)
		
		Turn(cinturon, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (cinturon, z_axis)
		return true
	elseif num == 2 then
		Signal(SIG_AIM1)
		SetSignalMask(SIG_AIM1)

		Turn(cinturon, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (cinturon, z_axis)
		return true
	end
end

--called after the weapon has fired
function script.FireWeapon()
	Hide(centro)
	Hide(cuchilla1)
	Hide(cuchilla2)
	Sleep(5000)
	Show(centro)
	Show(cuchilla1)
	Show(cuchilla2)
end
