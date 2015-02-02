local brazod = piece('brazod');
local brazoi = piece('brazoi');
local cabeza = piece('cabeza');
local capa = piece('capa');
local coxis = piece('coxis');
local coxiscentral = piece('coxiscentral');
local cuello = piece('cuello');
local espinillad = piece('espinillad');
local espinillai = piece('espinillai');
local flare = piece('flare');
local hombrerai = piece('hombrerai');
local hombrod = piece('hombrod');
local hombroi = piece('hombroi');
local manod = piece('manod');
local manoi = piece('manoi');
local muslod = piece('muslod');
local musloi = piece('musloi');
local pecho = piece('pecho');
local pied = piece('pied');
local piei = piece('piei');
local Point = piece('Point');
local Point.001 = piece('Point.001');
local Point.002 = piece('Point.002');
local Point.003 = piece('Point.003');
local Point.004 = piece('Point.004');
local Point.005 = piece('Point.005');
local Point.006 = piece('Point.006');
local Point.007 = piece('Point.007');
local Point.008 = piece('Point.008');
local Point.009 = piece('Point.009');
local Point.010 = piece('Point.010');
local Point.011 = piece('Point.011');
local Point.012 = piece('Point.012');
local Point.013 = piece('Point.013');
local Point.014 = piece('Point.014');
local Point.015 = piece('Point.015');
local Point.016 = piece('Point.016');
local Point.017 = piece('Point.017');
local Point.018 = piece('Point.018');
local Point.019 = piece('Point.019');
local Point.020 = piece('Point.020');
local Point.021 = piece('Point.021');
local Point.022 = piece('Point.022');
local Point.023 = piece('Point.023');
local Point.024 = piece('Point.024');
local Point.025 = piece('Point.025');
local Point.026 = piece('Point.026');
local Point.027 = piece('Point.027');
local Point.028 = piece('Point.028');
local Point.029 = piece('Point.029');
local Point.030 = piece('Point.030');
local Point.031 = piece('Point.031');
local Point.032 = piece('Point.032');
local Point.033 = piece('Point.033');
local Point.034 = piece('Point.034');
local Point.035 = piece('Point.035');
local Point.036 = piece('Point.036');
local Point.037 = piece('Point.037');
local Point.038 = piece('Point.038');
local Point.039 = piece('Point.039');
local Point.040 = piece('Point.040');
local Point.041 = piece('Point.041');
local Point.042 = piece('Point.042');
local Point.043 = piece('Point.043');
local Point.044 = piece('Point.044');
local rifle = piece('rifle');
local root = piece('root');
local Sun = piece('Sun');
local tapon = piece('tapon');
local Animations = {};

Animations['myAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='turn',['p']=espinillad, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=x_axis, ['t']=-2.067409, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=y_axis, ['t']=1.555296, ['s']=0.000000},
			{['c']='move',['p']=espinillad, ['a']=z_axis, ['t']=7.033658, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pied, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=x_axis, ['t']=-2.282368, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=y_axis, ['t']=3.603570, ['s']=0.000000},
			{['c']='move',['p']=pied, ['a']=z_axis, ['t']=1.080602, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=espinillai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=x_axis, ['t']=2.082659, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=y_axis, ['t']=-2.114497, ['s']=0.000000},
			{['c']='move',['p']=espinillai, ['a']=z_axis, ['t']=7.350704, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=musloi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=x_axis, ['t']=1.716741, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=y_axis, ['t']=0.232801, ['s']=0.000000},
			{['c']='move',['p']=musloi, ['a']=z_axis, ['t']=13.123219, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=muslod, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=x_axis, ['t']=-1.612402, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=y_axis, ['t']=0.232801, ['s']=0.000000},
			{['c']='move',['p']=muslod, ['a']=z_axis, ['t']=13.123219, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxis, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=x_axis, ['t']=-0.028486, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=y_axis, ['t']=0.089688, ['s']=0.000000},
			{['c']='move',['p']=coxis, ['a']=z_axis, ['t']=14.401241, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=2.228573, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=-2.517084, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=1.068017, ['s']=0.000000},
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
            