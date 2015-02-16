local armadura = piece('armadura');
local brazod = piece('brazod');
local brazoi = piece('brazoi');
local cabeza = piece('cabeza');
local coxis = piece('coxis');
local escopeta = piece('escopeta');
local espinillad = piece('espinillad');
local espinillai = piece('espinillai');
local flare1 = piece('flare1');
local flare2 = piece('flare2');
local hombrerad = piece('hombrerad');
local hombrerai = piece('hombrerai');
local hombrod = piece('hombrod');
local hombroi = piece('hombroi');
local manod = piece('manod');
local manoi = piece('manoi');
local muslod = piece('muslod');
local musloi = piece('musloi');
local pied = piece('pied');
local piei = piece('piei');
local root = piece('root');

local SIG_WALK = 1
local SIG_AIM = 2
local SIG_AIM1 = 4
local SIG_RESTORE = 8
local SIG_STOP = 16
local SIG_RESTORE = 32

local DELAY_SHOOT = 520

local shells = SFX.CEG
local cannonmuzzle = SFX.CEG + 1

local isMoving, isShooting, aimWeapon = false, false, false


local Animations = {};



Animations['restoreAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-1.900925, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=0.220750, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=7.179926, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=1.871489, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=0.220750, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=1.672201, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-1.934309, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=0.220750, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=1.672201, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=1.871488, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=0.220750, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=7.179924, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=x_axis, ['t']=1.443156, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=y_axis, ['t']=0.801622, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=z_axis, ['t']=14.344021, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=x_axis, ['t']=-0.020218, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=y_axis, ['t']=0.195752, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=16.362617, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=muslod, ['a']=x_axis, ['t']=-1.242262, ['s']=2.000000},
			{['c']='move',['p']=muslod, ['a']=y_axis, ['t']=0.801622, ['s']=2.000000},
			{['c']='move',['p']=muslod, ['a']=z_axis, ['t']=14.344020, ['s']=2.000000},
		}
	},
}

Animations['moveAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=1.549317, ['s']=4.622406},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000001, ['s']=0.000003},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000001, ['s']=0.000002},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-1.900925, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=0.220750, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=7.179926, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=1.871489, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=0.220750, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=1.672201, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-1.934309, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=0.220750, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=1.672201, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.646749, ['s']=0.463732},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=1.871488, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=0.220750, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=7.179924, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=-0.150404, ['s']=2.632620},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=x_axis, ['t']=1.443156, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=y_axis, ['t']=0.801622, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=z_axis, ['t']=14.344021, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=x_axis, ['t']=-0.020218, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=y_axis, ['t']=0.195752, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=16.220943, ['s']=9.938213},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.009344, ['s']=2.691158},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=x_axis, ['t']=-1.242262, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=y_axis, ['t']=0.801622, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=z_axis, ['t']=14.344020, ['s']=0.000000},
		}
	},
	{
		['time'] = 7,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.781616, ['s']=2.878876},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000002},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000001, ['s']=0.000001},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.512040, ['s']=0.505162},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.614347, ['s']=2.867819},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=13.902027, ['s']=8.695936},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=-0.772412, ['s']=2.931587},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 15,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.518742, ['s']=1.126605},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000001},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000001},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=1.618526, ['s']=4.742087},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.000069, ['s']=2.632620},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=16.526066, ['s']=11.245880},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=-0.144476, ['s']=2.691158},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 22,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.470755, ['s']=0.179950},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.754954, ['s']=3.238398},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=-0.764682, ['s']=2.867819},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=13.902027, ['s']=9.840145},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.637281, ['s']=2.931587},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 30,
		['commands'] = {
		}
	},
}


function constructSkeleton(unit, piece, offset)
    if (offset == nil) then
        offset = {0,0,0};
    end

    local bones = {};
    local info = Spring.GetUnitPieceInfo(unit,piece);

    for i=1,3 do
        info.offset[i] = offset[i]+info.offset[i];
    end 

    bones[piece] = info.offset;
    local map = Spring.GetUnitPieceMap(unit);
    local children = info.children;

    if (children) then
        for i, childName in pairs(children) do
            local childId = map[childName];
            local childBones = constructSkeleton(unit, childId, info.offset);
            for cid, cinfo in pairs(childBones) do
                bones[cid] = cinfo;
            end
        end
    end        
    return bones;
end

function script.Create()
    local map = Spring.GetUnitPieceMap(unitID);
    local offsets = constructSkeleton(unitID,map.Scene, {0,0,0});
    
    for a,anim in pairs(Animations) do
        for i,keyframe in pairs(anim) do
            local commands = keyframe.commands;
            for k,command in pairs(commands) do
                -- commands are described in (c)ommand,(p)iece,(a)xis,(t)arget,(s)peed format
                -- the t attribute needs to be adjusted for move commands from blender's absolute values
                if (command.c == "move") then
                    local adjusted =  command.t - (offsets[command.p][command.a]);
                    Animations[a][i]['commands'][k].t = command.t - (offsets[command.p][command.a]);
                end
            end
        end
    end
end
            
local animCmd = {['turn']=Turn,['move']=Move};
function PlayAnimation(animname)
    local anim = Animations[animname];
    for i = 1, #anim do
        local commands = anim[i].commands;
        for j = 1,#commands do
            local cmd = commands[j];
            animCmd[cmd.c](cmd.p,cmd.a,cmd.t,cmd.s);
        end
        if(i < #anim) then
            local t = anim[i+1]['time'] - anim[i]['time'];
            Sleep(t*33); -- sleep works on milliseconds
        end
    end
end


-----------------------WALK-----------------------

local function Walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	
	isMoving = true
	while true do
		PlayAnimation('moveAnimation')
		Sleep(0)
	end
end


local function RestorePose()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	PlayAnimation('restoreAnimation')
end


function script.StartMoving(heading)
	Turn(armadura, z_axis, heading, math.rad(200))
	StartThread (Walk)
end

function script.StopMoving()
	isMoving = false
	StartThread(RestorePose)
end


---AIMING & SHOOTING---

function script.Shot(num)
end

function script.AimFromWeapon()
	return escopeta
end

function script.QueryWeapon() 
	return flare1
end
--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed

function script.AimWeapon(num, heading, pitch )
	--make sure the aiming animation is only run once
	if num == 1 then
		Signal(SIG_AIM)
		SetSignalMask(SIG_AIM)
		
		Turn(armadura, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (armadura, z_axis)
		return true
	elseif num == 2 then
		Signal(SIG_AIM1)
		SetSignalMask(SIG_AIM1)

		Turn(armadura, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (armadura, z_axis)
		return true
	end
end

--called after the weapon has fired
function script.FireWeapon()
	EmitSfx(flare1, cannonmuzzle)
	EmitSfx(flare2, shells)
end


            
