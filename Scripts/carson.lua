local brazod = piece('brazod');
local brazoi = piece('brazoi');
local cabeza = piece('cabeza');
local cannon = piece('cannon');
local coxis = piece('coxis');
local espinillad = piece('espinillad');
local espinillai = piece('espinillai');
local flare = piece('flare');
local flare2 = piece('flare2');
local hombrerad = piece('hombrerad');
local hombrerai = piece('hombrerai');
local hombrod = piece('hombrod');
local hombroi = piece('hombroi');
local manod = piece('manod');
local manoi = piece('manoi');
local machinegun = piece('machinegun');
local muslod = piece('muslod');
local musloi = piece('musloi');
local pied = piece('pied');
local piei = piece('piei');
local rodillad = piece('rodillad');
local rodillai = piece('rodillai');
local root = piece('root');
local torso = piece('torso');

local cannon_speed = math.rad(500)

local SIG_WALK = 1
local SIG_AIM = 2
local SIG_AIM1 = 4
local SIG_RESTORE = 8
local SIG_STOP = 16
local SIG_RESTORE = 32

local DELAY_SHOOT = 520

local shells = SFX.CEG
local warmuzzle = SFX.CEG + 1

local isMoving, isShooting, aimWeapon = false, false, false



local Animations = {};

Animations['restoreAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=muslod, ['a']=x_axis, ['t']=-1.677753, ['s']=2.000000},
			{['c']='move',['p']=muslod, ['a']=y_axis, ['t']=-0.127389, ['s']=2.000000},
			{['c']='move',['p']=muslod, ['a']=z_axis, ['t']=14.268076, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=2.179500, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=-0.456106, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=0.918459, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-2.181536, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=-0.456106, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=0.918459, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=rodillai, ['a']=x_axis, ['t']=1.829497, ['s']=2.000000},
			{['c']='move',['p']=rodillai, ['a']=y_axis, ['t']=-0.215106, ['s']=2.000000},
			{['c']='move',['p']=rodillai, ['a']=z_axis, ['t']=7.720939, ['s']=2.000000},
			{['c']='turn',['p']=rodillai, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=rodillai, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=rodillai, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=rodillad, ['a']=x_axis, ['t']=-1.829499, ['s']=2.000000},
			{['c']='move',['p']=rodillad, ['a']=y_axis, ['t']=-0.215106, ['s']=2.000000},
			{['c']='move',['p']=rodillad, ['a']=z_axis, ['t']=7.720934, ['s']=2.000000},
			{['c']='turn',['p']=rodillad, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=rodillad, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=rodillad, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=2.047467, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=-0.187192, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=6.923474, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=x_axis, ['t']=-0.000000, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=y_axis, ['t']=0.033764, ['s']=2.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=15.178805, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=coxis, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=x_axis, ['t']=1.573190, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=y_axis, ['t']=-0.127389, ['s']=2.000000},
			{['c']='move',['p']=musloi, ['a']=z_axis, ['t']=14.268076, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-2.025780, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=-0.187192, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=6.923473, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
		}
	},
}

Animations['moveAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=-0.083931, ['s']=1.887676},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=x_axis, ['t']=1.573190, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=y_axis, ['t']=-0.127389, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=z_axis, ['t']=14.268078, ['s']=0.000000},
			{['c']='turn',['p']=rodillad, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=rodillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=rodillad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=rodillad, ['a']=x_axis, ['t']=-1.829499, ['s']=0.000000},
			{['c']='move',['p']=rodillad, ['a']=y_axis, ['t']=-0.215106, ['s']=0.000000},
			{['c']='move',['p']=rodillad, ['a']=z_axis, ['t']=7.720936, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=1.313864, ['s']=3.190407},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=2.047467, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=-0.187192, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=6.923474, ['s']=0.000000},
			{['c']='turn',['p']=rodillai, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=rodillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=rodillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=rodillai, ['a']=x_axis, ['t']=1.829497, ['s']=0.000000},
			{['c']='move',['p']=rodillai, ['a']=y_axis, ['t']=-0.215106, ['s']=0.000000},
			{['c']='move',['p']=rodillai, ['a']=z_axis, ['t']=7.720938, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=-0.186534, ['s']=1.909670},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=x_axis, ['t']=-1.677753, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=y_axis, ['t']=-0.127389, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=z_axis, ['t']=14.268078, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=x_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=y_axis, ['t']=0.033764, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=14.859661, ['s']=5.052975},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.537700, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-2.025780, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=-0.187192, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=6.923473, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=-0.172777, ['s']=0.601331},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=2.179501, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=-0.456106, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=0.918460, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=-0.379075, ['s']=1.624607},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-2.181536, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=-0.456106, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=0.918459, ['s']=0.000000},
		}
	},
	{
		['time'] = 7,
		['commands'] = {
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=-0.632283, ['s']=2.056321},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.569436, ['s']=2.791606},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.368207, ['s']=2.080279},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=13.680634, ['s']=4.421353},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.001904, ['s']=0.655054},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=-0.285675, ['s']=0.350249},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 15,
		['commands'] = {
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=-0.191825, ['s']=1.887676},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=-0.077382, ['s']=1.909670},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=14.679331, ['s']=4.280131},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=1.378357, ['s']=3.602814},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=-0.370603, ['s']=1.596460},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=-0.122426, ['s']=0.699640},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 22,
		['commands'] = {
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.356527, ['s']=2.056321},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=-0.632124, ['s']=2.080279},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=13.680634, ['s']=3.745115},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.537700, ['s']=3.152463},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=-0.313088, ['s']=0.215684},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=0.459098},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
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

local function stopCannon(num)
	if num == 1 then
		Signal(SIG_STOP)
		SetSignalMask(SIG_STOP)
		Sleep(2000)
		StopSpin(cannon, y_axis)
	elseif num == 2 then
		Signal(SIG_STOP)
		SetSignalMask(SIG_STOP)
		Sleep(10000)
		StopSpin(cannon, y_axis)
	end
end


local function blockMove(num)
	if num == 2 then
		Spring.MoveCtrl.Enable(unitID)
		isMoving = false
		Signal(SIG_RESTORE)
		SetSignalMask(SIG_RESTORE)
		Sleep(6500)
		Spring.MoveCtrl.Disable(unitID)
	end
end

function script.StartMoving(heading)
	Turn(torso, z_axis, heading, math.rad(200))
	StartThread (Walk)
end

function script.StopMoving()
	isMoving = false
	StartThread(RestorePose)
end


---AIMING & SHOOTING---

function script.Shot(num)
	EmitSfx(flare2, warmuzzle)
	EmitSfx(flare, shells)
end

function script.AimFromWeapon()
	return machinegun
end

function script.QueryWeapon() 
	return flare
end
--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed

function script.AimWeapon(num, heading, pitch )
	--make sure the aiming animation is only run once
	Spin(cannon, y_axis, cannon_speed)
	if num == 1 then
		Signal(SIG_AIM)
		SetSignalMask(SIG_AIM)

		StartThread(stopCannon,1)

		Turn(torso, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (torso, z_axis)
		return true
	elseif num == 2 then
		Signal(SIG_AIM1)
		SetSignalMask(SIG_AIM1)
		
		StartThread(RestorePose)
		StartThread(blockMove,2)
		StartThread(stopCannon,2)

		Turn(torso, z_axis, heading, math.rad(200))

		--wait until the weapon is pointed in the right direction
		WaitForTurn (torso, z_axis)
		return true
	end
end

--called after the weapon has fired
function script.FireWeapon()
end

            
