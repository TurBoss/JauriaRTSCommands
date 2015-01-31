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
			{['c']='turn',['p']=cuello, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cuello, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cuello, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=cuello, ['a']=x_axis, ['t']=0.003410, ['s']=0.000000},
			{['c']='move',['p']=cuello, ['a']=y_axis, ['t']=-0.739189, ['s']=0.000000},
			{['c']='move',['p']=cuello, ['a']=z_axis, ['t']=22.407827, ['s']=0.000000},
			{['c']='turn',['p']=rifle, ['a']=x_axis, ['t']=0.284692, ['s']=0.322132},
			{['c']='turn',['p']=rifle, ['a']=y_axis, ['t']=0.245820, ['s']=2.485477},
			{['c']='turn',['p']=rifle, ['a']=z_axis, ['t']=-0.200552, ['s']=0.768813},
			{['c']='move',['p']=rifle, ['a']=x_axis, ['t']=2.793333, ['s']=3.605956},
			{['c']='move',['p']=rifle, ['a']=y_axis, ['t']=-8.375342, ['s']=4.192255},
			{['c']='move',['p']=rifle, ['a']=z_axis, ['t']=16.566235, ['s']=14.193749},
			{['c']='turn',['p']=manod, ['a']=x_axis, ['t']=0.315588, ['s']=2.980558},
			{['c']='turn',['p']=manod, ['a']=y_axis, ['t']=0.071443, ['s']=0.212533},
			{['c']='turn',['p']=manod, ['a']=z_axis, ['t']=-0.051801, ['s']=1.548914},
			{['c']='move',['p']=manod, ['a']=x_axis, ['t']=-2.569294, ['s']=0.660708},
			{['c']='move',['p']=manod, ['a']=y_axis, ['t']=-4.105369, ['s']=0.626069},
			{['c']='move',['p']=manod, ['a']=z_axis, ['t']=16.366638, ['s']=0.909262},
			{['c']='turn',['p']=hombrerai, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=hombrerai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=hombrerai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=hombrerai, ['a']=x_axis, ['t']=-0.023054, ['s']=0.000000},
			{['c']='move',['p']=hombrerai, ['a']=y_axis, ['t']=-0.439716, ['s']=0.000000},
			{['c']='move',['p']=hombrerai, ['a']=z_axis, ['t']=22.947618, ['s']=0.000000},
			{['c']='turn',['p']=cabeza, ['a']=x_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cabeza, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cabeza, ['a']=z_axis, ['t']=0.344838, ['s']=1.189499},
			{['c']='move',['p']=cabeza, ['a']=x_axis, ['t']=-0.023054, ['s']=0.000000},
			{['c']='move',['p']=cabeza, ['a']=y_axis, ['t']=-1.154238, ['s']=0.000000},
			{['c']='move',['p']=cabeza, ['a']=z_axis, ['t']=25.584265, ['s']=0.000000},
			{['c']='turn',['p']=hombroi, ['a']=x_axis, ['t']=-0.909519, ['s']=0.000000},
			{['c']='turn',['p']=hombroi, ['a']=y_axis, ['t']=0.625526, ['s']=0.000000},
			{['c']='turn',['p']=hombroi, ['a']=z_axis, ['t']=-0.025293, ['s']=0.000000},
			{['c']='move',['p']=hombroi, ['a']=x_axis, ['t']=3.247565, ['s']=0.000000},
			{['c']='move',['p']=hombroi, ['a']=y_axis, ['t']=-0.477668, ['s']=0.000000},
			{['c']='move',['p']=hombroi, ['a']=z_axis, ['t']=21.408901, ['s']=0.000000},
			{['c']='turn',['p']=coxiscentral, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxiscentral, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=coxiscentral, ['a']=z_axis, ['t']=-0.524960, ['s']=0.493218},
			{['c']='move',['p']=coxiscentral, ['a']=x_axis, ['t']=-0.023054, ['s']=0.000000},
			{['c']='move',['p']=coxiscentral, ['a']=y_axis, ['t']=0.521167, ['s']=0.000000},
			{['c']='move',['p']=coxiscentral, ['a']=z_axis, ['t']=14.084007, ['s']=0.000000},
			{['c']='turn',['p']=manoi, ['a']=x_axis, ['t']=0.448502, ['s']=0.000000},
			{['c']='turn',['p']=manoi, ['a']=y_axis, ['t']=-0.134628, ['s']=0.000000},
			{['c']='turn',['p']=manoi, ['a']=z_axis, ['t']=0.093822, ['s']=0.000000},
			{['c']='move',['p']=manoi, ['a']=x_axis, ['t']=3.931734, ['s']=0.000000},
			{['c']='move',['p']=manoi, ['a']=y_axis, ['t']=-6.272563, ['s']=0.000000},
			{['c']='move',['p']=manoi, ['a']=z_axis, ['t']=17.717812, ['s']=0.000000},
			{['c']='turn',['p']=pecho, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pecho, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pecho, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pecho, ['a']=x_axis, ['t']=0.003410, ['s']=0.000000},
			{['c']='move',['p']=pecho, ['a']=y_axis, ['t']=-0.477668, ['s']=0.000000},
			{['c']='move',['p']=pecho, ['a']=z_axis, ['t']=16.852190, ['s']=0.000000},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=0.940728, ['s']=0.113946},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=-0.413237, ['s']=0.800443},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=-0.362699, ['s']=0.522821},
			{['c']='move',['p']=brazoi, ['a']=x_axis, ['t']=5.153582, ['s']=0.000000},
			{['c']='move',['p']=brazoi, ['a']=y_axis, ['t']=-1.178931, ['s']=0.000000},
			{['c']='move',['p']=brazoi, ['a']=z_axis, ['t']=16.089970, ['s']=0.000000},
			{['c']='turn',['p']=hombrod, ['a']=x_axis, ['t']=-0.417860, ['s']=1.566444},
			{['c']='turn',['p']=hombrod, ['a']=y_axis, ['t']=0.010290, ['s']=0.045964},
			{['c']='turn',['p']=hombrod, ['a']=z_axis, ['t']=0.015476, ['s']=1.546934},
			{['c']='move',['p']=hombrod, ['a']=x_axis, ['t']=-3.247495, ['s']=0.000000},
			{['c']='move',['p']=hombrod, ['a']=y_axis, ['t']=-0.477668, ['s']=0.000000},
			{['c']='move',['p']=hombrod, ['a']=z_axis, ['t']=21.408901, ['s']=0.000000},
			{['c']='turn',['p']=brazod, ['a']=x_axis, ['t']=0.194952, ['s']=2.618038},
			{['c']='turn',['p']=brazod, ['a']=y_axis, ['t']=-0.174046, ['s']=0.685072},
			{['c']='turn',['p']=brazod, ['a']=z_axis, ['t']=-0.219010, ['s']=1.771571},
			{['c']='move',['p']=brazod, ['a']=x_axis, ['t']=-7.360277, ['s']=0.000000},
			{['c']='move',['p']=brazod, ['a']=y_axis, ['t']=-1.787073, ['s']=0.000000},
			{['c']='move',['p']=brazod, ['a']=z_axis, ['t']=17.698545, ['s']=0.000000},
			{['c']='turn',['p']=capa, ['a']=x_axis, ['t']=0.311955, ['s']=0.000000},
			{['c']='turn',['p']=capa, ['a']=y_axis, ['t']=-0.036414, ['s']=0.000000},
			{['c']='turn',['p']=capa, ['a']=z_axis, ['t']=0.003204, ['s']=0.000000},
			{['c']='move',['p']=capa, ['a']=x_axis, ['t']=-0.005967, ['s']=0.000000},
			{['c']='move',['p']=capa, ['a']=y_axis, ['t']=1.609871, ['s']=0.000000},
			{['c']='move',['p']=capa, ['a']=z_axis, ['t']=22.159639, ['s']=0.000000},
		}
	},
	{
		['time'] = 6,
		['commands'] = {
			{['c']='turn',['p']=rifle, ['a']=x_axis, ['t']=0.000000, ['s']=1.220110},
			{['c']='turn',['p']=rifle, ['a']=y_axis, ['t']=0.000000, ['s']=1.053512},
			{['c']='turn',['p']=rifle, ['a']=z_axis, ['t']=0.000000, ['s']=0.859507},
			{['c']='move',['p']=rifle, ['a']=x_axis, ['t']=4.176844, ['s']=5.929333},
			{['c']='move',['p']=rifle, ['a']=y_axis, ['t']=-6.540286, ['s']=7.864529},
			{['c']='move',['p']=rifle, ['a']=z_axis, ['t']=18.935457, ['s']=10.153811},
			{['c']='turn',['p']=manod, ['a']=x_axis, ['t']=0.000000, ['s']=1.352522},
			{['c']='turn',['p']=manod, ['a']=y_axis, ['t']=0.000000, ['s']=0.306186},
			{['c']='turn',['p']=manod, ['a']=z_axis, ['t']=0.000000, ['s']=0.222006},
			{['c']='turn',['p']=hombroi, ['a']=x_axis, ['t']=-0.371034, ['s']=2.307792},
			{['c']='turn',['p']=hombroi, ['a']=y_axis, ['t']=0.169439, ['s']=1.954658},
			{['c']='turn',['p']=hombroi, ['a']=z_axis, ['t']=-0.011375, ['s']=0.059649},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=0.569217, ['s']=1.592191},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=-0.010442, ['s']=1.726261},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=-0.295406, ['s']=0.288397},
			{['c']='turn',['p']=hombrod, ['a']=x_axis, ['t']=0.032899, ['s']=1.931824},
			{['c']='turn',['p']=hombrod, ['a']=y_axis, ['t']=0.308680, ['s']=1.278813},
			{['c']='turn',['p']=hombrod, ['a']=z_axis, ['t']=-0.014620, ['s']=0.128982},
			{['c']='turn',['p']=brazod, ['a']=x_axis, ['t']=0.133771, ['s']=0.262204},
			{['c']='turn',['p']=brazod, ['a']=y_axis, ['t']=-0.223675, ['s']=0.212695},
			{['c']='turn',['p']=brazod, ['a']=z_axis, ['t']=-0.239206, ['s']=0.086555},
		}
	},
	{
		['time'] = 13,
		['commands'] = {
			{['c']='turn',['p']=cabeza, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cabeza, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=cabeza, ['a']=z_axis, ['t']=0.000000, ['s']=1.477876},
			{['c']='turn',['p']=hombroi, ['a']=x_axis, ['t']=-0.240832, ['s']=0.558008},
			{['c']='turn',['p']=hombroi, ['a']=y_axis, ['t']=-0.056719, ['s']=0.969251},
			{['c']='turn',['p']=hombroi, ['a']=z_axis, ['t']=0.006865, ['s']=0.078171},
			{['c']='turn',['p']=coxiscentral, ['a']=z_axis, ['t']=-0.226846, ['s']=1.277632},
			{['c']='turn',['p']=manoi, ['a']=x_axis, ['t']=0.000000, ['s']=1.922153},
			{['c']='turn',['p']=manoi, ['a']=y_axis, ['t']=0.000000, ['s']=0.576979},
			{['c']='turn',['p']=manoi, ['a']=z_axis, ['t']=0.000000, ['s']=0.402095},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=0.348769, ['s']=0.944774},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=0.084033, ['s']=0.404893},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=0.014813, ['s']=1.329510},
			{['c']='turn',['p']=hombrod, ['a']=x_axis, ['t']=0.000000, ['s']=0.140995},
			{['c']='turn',['p']=hombrod, ['a']=y_axis, ['t']=0.000000, ['s']=1.322915},
			{['c']='turn',['p']=hombrod, ['a']=z_axis, ['t']=0.000000, ['s']=0.062656},
			{['c']='turn',['p']=brazod, ['a']=x_axis, ['t']=0.000000, ['s']=0.573304},
			{['c']='turn',['p']=brazod, ['a']=y_axis, ['t']=0.000000, ['s']=0.958605},
			{['c']='turn',['p']=brazod, ['a']=z_axis, ['t']=-0.151874, ['s']=0.374282},
		}
	},
	{
		['time'] = 20,
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
            