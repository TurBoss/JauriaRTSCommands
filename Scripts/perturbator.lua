local antebrazod = piece('antebrazod');
local antebrazoi = piece('antebrazoi');
local arma = piece('arma');
local cabeza = piece('cabeza');
local coxis = piece('coxis');
local cuerpo = piece('cuerpo');
local espinillad = piece('espinillad');
local espinillai = piece('espinillai');
local flare1 = piece('flare1');
local flare2 = piece('flare2');
local hombrod = piece('hombrod');
local hombroi = piece('hombroi');
local manod = piece('manod');
local manoi = piece('manoi');
local pied = piece('pied');
local piei = piece('piei');
local piernad = piece('piernad');
local piernai = piece('piernai');
local root = piece('root');

--------------------------------------------------------------------------------
-- constants
--------------------------------------------------------------------------------

local SIG_WALK = 1
local SIG_WALK1 = 2
local SIG_AIM = 4
local SIG_AIM1 = 8
local SIG_RESTORE = 16
local SIG_RC = 32

local RESTORE_DELAY_SHOOT = 1500
local DELAY_SHOOT = 520

local shells = SFX.CEG
local muzzle = SFX.CEG + 1
--------------------------------------------------------------------------------
-- vars
--------------------------------------------------------------------------------

local isMoving, isShooting, aimWeapon = false, false, false

--------------------------------------------------------------------------------
-- tables
--------------------------------------------------------------------------------
local Animations = {};

Animations['restoreLegs'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=1.785297, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=0.039354, ['s']=2.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=1.280824, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=piernai, ['a']=x_axis, ['t']=1.247167, ['s']=2.000000},
			{['c']='move',['p']=piernai, ['a']=y_axis, ['t']=0.121628, ['s']=2.000000},
			{['c']='move',['p']=piernai, ['a']=z_axis, ['t']=14.942532, ['s']=2.000000},
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=1.733026, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=0.283794, ['s']=2.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=8.799884, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=piernad, ['a']=x_axis, ['t']=-1.213824, ['s']=2.000000},
			{['c']='move',['p']=piernad, ['a']=y_axis, ['t']=0.121628, ['s']=2.000000},
			{['c']='move',['p']=piernad, ['a']=z_axis, ['t']=14.942531, ['s']=2.000000},
			{['c']='turn',['p']=piernad, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piernad, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=piernad, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-1.834640, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=0.283794, ['s']=2.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=8.799883, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-1.776327, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=0.034702, ['s']=2.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=1.267878, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
		}
	},
}
Animations['restoreTorso'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=flare2, ['a']=x_axis, ['t']=-4.641041, ['s']=2.000000},
			{['c']='move',['p']=flare2, ['a']=y_axis, ['t']=-1.536443, ['s']=2.000000},
			{['c']='move',['p']=flare2, ['a']=z_axis, ['t']=3.742706, ['s']=2.000000},
			{['c']='turn',['p']=flare2, ['a']=x_axis, ['t']=3.024175, ['s']=2.000000},
			{['c']='turn',['p']=flare2, ['a']=y_axis, ['t']=-0.000000, ['s']=2.000000},
			{['c']='turn',['p']=flare2, ['a']=z_axis, ['t']=0.000001, ['s']=2.000000},
			{['c']='move',['p']=manod, ['a']=x_axis, ['t']=-4.553908, ['s']=2.000000},
			{['c']='move',['p']=manod, ['a']=y_axis, ['t']=-0.057223, ['s']=2.000000},
			{['c']='move',['p']=manod, ['a']=z_axis, ['t']=12.962830, ['s']=2.000000},
			{['c']='turn',['p']=manod, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=manod, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=manod, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=flare1, ['a']=x_axis, ['t']=-4.641041, ['s']=2.000000},
			{['c']='move',['p']=flare1, ['a']=y_axis, ['t']=-2.591265, ['s']=2.000000},
			{['c']='move',['p']=flare1, ['a']=z_axis, ['t']=3.826422, ['s']=2.000000},
			{['c']='turn',['p']=flare1, ['a']=x_axis, ['t']=3.024175, ['s']=2.000000},
			{['c']='turn',['p']=flare1, ['a']=y_axis, ['t']=-0.000000, ['s']=2.000000},
			{['c']='turn',['p']=flare1, ['a']=z_axis, ['t']=0.000001, ['s']=2.000000},
			{['c']='move',['p']=hombrod, ['a']=x_axis, ['t']=-4.655038, ['s']=2.000000},
			{['c']='move',['p']=hombrod, ['a']=y_axis, ['t']=0.162701, ['s']=2.000000},
			{['c']='move',['p']=hombrod, ['a']=z_axis, ['t']=21.922890, ['s']=2.000000},
			{['c']='turn',['p']=hombrod, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=hombrod, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=hombrod, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=manoi, ['a']=x_axis, ['t']=4.477272, ['s']=2.000000},
			{['c']='move',['p']=manoi, ['a']=y_axis, ['t']=-0.039358, ['s']=2.000000},
			{['c']='move',['p']=manoi, ['a']=z_axis, ['t']=12.859845, ['s']=2.000000},
			{['c']='turn',['p']=manoi, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=manoi, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=manoi, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=hombroi, ['a']=x_axis, ['t']=4.647837, ['s']=2.000000},
			{['c']='move',['p']=hombroi, ['a']=y_axis, ['t']=0.171828, ['s']=2.000000},
			{['c']='move',['p']=hombroi, ['a']=z_axis, ['t']=21.915218, ['s']=2.000000},
			{['c']='turn',['p']=hombroi, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=hombroi, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=hombroi, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=antebrazod, ['a']=x_axis, ['t']=-4.724315, ['s']=2.000000},
			{['c']='move',['p']=antebrazod, ['a']=y_axis, ['t']=0.121628, ['s']=2.000000},
			{['c']='move',['p']=antebrazod, ['a']=z_axis, ['t']=18.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazod, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazod, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazod, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=cabeza, ['a']=x_axis, ['t']=0.001549, ['s']=2.000000},
			{['c']='move',['p']=cabeza, ['a']=y_axis, ['t']=-0.479456, ['s']=2.000000},
			{['c']='move',['p']=cabeza, ['a']=z_axis, ['t']=24.147640, ['s']=2.000000},
			{['c']='turn',['p']=cabeza, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=cabeza, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=cabeza, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=arma, ['a']=x_axis, ['t']=-4.628988, ['s']=2.000000},
			{['c']='move',['p']=arma, ['a']=y_axis, ['t']=-1.536269, ['s']=2.000000},
			{['c']='move',['p']=arma, ['a']=z_axis, ['t']=10.287711, ['s']=2.000000},
			{['c']='turn',['p']=arma, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=arma, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=arma, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=cuerpo, ['a']=x_axis, ['t']=0.001736, ['s']=2.000000},
			{['c']='move',['p']=cuerpo, ['a']=y_axis, ['t']=-0.184347, ['s']=2.000000},
			{['c']='move',['p']=cuerpo, ['a']=z_axis, ['t']=21.666813, ['s']=2.000000},
			{['c']='turn',['p']=cuerpo, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=cuerpo, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=cuerpo, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='move',['p']=antebrazoi, ['a']=x_axis, ['t']=4.623252, ['s']=2.000000},
			{['c']='move',['p']=antebrazoi, ['a']=y_axis, ['t']=0.121628, ['s']=2.000000},
			{['c']='move',['p']=antebrazoi, ['a']=z_axis, ['t']=18.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=x_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=y_axis, ['t']=0.000000, ['s']=2.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=z_axis, ['t']=0.000000, ['s']=2.000000},
		}
	},
}

Animations['walk'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=1.785297, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=0.039354, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=1.280824, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=x_axis, ['t']=1.247167, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=y_axis, ['t']=0.121628, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=z_axis, ['t']=14.942532, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=-0.104081, ['s']=2.061411},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=1.733026, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=0.283794, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=8.799884, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=piernad, ['a']=x_axis, ['t']=-1.213824, ['s']=0.000000},
			{['c']='move',['p']=piernad, ['a']=y_axis, ['t']=0.121628, ['s']=0.000000},
			{['c']='move',['p']=piernad, ['a']=z_axis, ['t']=14.942531, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=x_axis, ['t']=0.019285, ['s']=2.028799},
			{['c']='turn',['p']=piernad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-1.834640, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=0.283794, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=8.799883, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.880487, ['s']=3.773515},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000001},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=-0.000001, ['s']=0.000003},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-1.776327, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=0.034702, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=1.267878, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 7,
		['commands'] = {
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=0.494740, ['s']=2.245578},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=x_axis, ['t']=-0.570062, ['s']=2.210053},
			{['c']='turn',['p']=piernad, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.000000, ['s']=3.301825},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000001},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000003},
		}
	},
	{
		['time'] = 15,
		['commands'] = {
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=-0.104080, ['s']=2.245578},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=x_axis, ['t']=0.019285, ['s']=2.210052},
			{['c']='turn',['p']=piernad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=1.029251, ['s']=3.859690},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000002},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000001, ['s']=0.000003},
		}
	},
	{
		['time'] = 23,
		['commands'] = {
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=-0.585077, ['s']=2.061412},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=x_axis, ['t']=0.492672, ['s']=2.028800},
			{['c']='turn',['p']=piernad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=4.411075},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000002},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000003},
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
		PlayAnimation('walk')
		Sleep(0)
	end
end

local function MoveTorso()
	Signal(SIG_WALK1)
	SetSignalMask(SIG_WALK1)
	while true do
		if not isShooting then
			PlayAnimation('moveTorso')
		end
		Sleep(0)
	end
end

local function RestoreLegs()
	Signal(SIG_WALK)
	Signal(SIG_WALK1)
	SetSignalMask(SIG_WALK)
	SetSignalMask(SIG_WALK1)
	PlayAnimation('restoreLegs')
end

local function RestoreTorso()
	Signal(SIG_RESTORE)
	SetSignalMask(SIG_RESTORE)
	Sleep(RESTORE_DELAY_SHOOT)
	isShooting = false
	PlayAnimation('restoreTorso')
end

function script.StartMoving(heading)
	
	StartThread (Walk)
	--StartThread (MoveTorso)
end

function script.StopMoving()
	isMoving = false
	StartThread(RestoreLegs)
	StartThread(RestoreTorso)
end

---AIMING & SHOOTING---

--function script.Shot(num)
--	EmitSfx(flare, muzzle)
--	EmitSfx(flare2, shells)
--end

function script.AimFromWeapon()
	return arma
end

function script.QueryWeapon() 
	return flare1
end

--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed

function script.AimWeapon(num, heading, pitch )
	Signal(SIG_AIM)
	SetSignalMask(SIG_AIM)
	
	Turn(cuerpo, z_axis, heading,  math.rad(120))
	Turn(hombrod, x_axis, -pitch-0.5, math.rad(120))
	Turn(antebrazod, x_axis, -pitch-1.0, math.rad(120))
	
	WaitForTurn(cuerpo, z_axis)
	WaitForTurn(hombrod, x_axis)
	WaitForTurn(antebrazod, x_axis)
	
	StartThread(RestoreTorso)
	isShooting = true
	return true
end

--called after the weapon has fired

function script.FireWeapon1()
end

function script.FireWeapon3()
end

----death animation: fall over & explode
function script.Killed(recentDamage, maxHealth)

	--Explode (chasis, SFX.SHATTER)
	--Explode (cristal, SFX.FIRE)


end

