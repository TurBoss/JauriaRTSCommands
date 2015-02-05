local antebrazo = piece('antebrazo');
local antebrazoi = piece('antebrazoi');
local armadura = piece('armadura');
local brazo = piece('brazo');
local brazoi = piece('brazoi');
local cabeza = piece('cabeza');
local color = piece('color');
local culo = piece('culo');
local entrepiernad = piece('entrepiernad');
local entrepiernai = piece('entrepiernai');
local mochila = piece('mochila');
local pie = piece('pie');
local piei = piece('piei');
local pierna = piece('pierna');
local piernai = piece('piernai');
local pipa = piece('pipa');
local pipa001 = piece('pipa001');
local root = piece('root');
local torso = piece('torso');
local flare = piece('flare');

--------------------------------------------------------------------------------
-- constants
--------------------------------------------------------------------------------

local SIG_WALK = 1
local SIG_WALK1 = 2
local SIG_AIM = 4
local SIG_AIM1 = 8
local SIG_RESTORE = 16

local RESTORE_DELAY_SHOOT = 1500
local DELAY_SHOOT = 520

--------------------------------------------------------------------------------
-- vars
--------------------------------------------------------------------------------

local isMoving, isShooting, weaponAim = false, false, false

--------------------------------------------------------------------------------
-- tables
--------------------------------------------------------------------------------
local Animations = {};

Animations['restoreLegsAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=entrepiernai, ['a']=x_axis, ['t']=1.214576, ['s']=1.000000},
			{['c']='move',['p']=entrepiernai, ['a']=y_axis, ['t']=-0.084784, ['s']=1.000000},
			{['c']='move',['p']=entrepiernai, ['a']=z_axis, ['t']=12.077648, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='move',['p']=piernai, ['a']=x_axis, ['t']=2.556551, ['s']=1.000000},
			{['c']='move',['p']=piernai, ['a']=y_axis, ['t']=-0.355256, ['s']=1.000000},
			{['c']='move',['p']=piernai, ['a']=z_axis, ['t']=7.565503, ['s']=1.000000},
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=pie, ['a']=x_axis, ['t']=-2.892862, ['s']=1.000000},
			{['c']='move',['p']=pie, ['a']=y_axis, ['t']=0.605459, ['s']=1.000000},
			{['c']='move',['p']=pie, ['a']=z_axis, ['t']=0.747936, ['s']=1.000000},
			{['c']='turn',['p']=pie, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pie, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pie, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=pierna, ['a']=x_axis, ['t']=-2.458014, ['s']=1.000000},
			{['c']='move',['p']=pierna, ['a']=y_axis, ['t']=-0.355256, ['s']=1.000000},
			{['c']='move',['p']=pierna, ['a']=z_axis, ['t']=7.565501, ['s']=1.000000},
			{['c']='turn',['p']=pierna, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pierna, ['a']=y_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pierna, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='move',['p']=entrepiernad, ['a']=x_axis, ['t']=-1.213918, ['s']=1.000000},
			{['c']='move',['p']=entrepiernad, ['a']=y_axis, ['t']=-0.084784, ['s']=1.000000},
			{['c']='move',['p']=entrepiernad, ['a']=z_axis, ['t']=12.077648, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=3.260389, ['s']=1.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=1.036430, ['s']=1.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=0.735140, ['s']=1.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
		}
	},
}


Animations['restoreTorsoAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=cabeza, ['a']=x_axis, ['t']=0.059010, ['s']=1.000000},
			{['c']='move',['p']=cabeza, ['a']=y_axis, ['t']=-1.442355, ['s']=1.000000},
			{['c']='move',['p']=cabeza, ['a']=z_axis, ['t']=21.363506, ['s']=1.000000},
			{['c']='turn',['p']=cabeza, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=cabeza, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=cabeza, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=torso, ['a']=x_axis, ['t']=0.094849, ['s']=1.000000},
			{['c']='move',['p']=torso, ['a']=y_axis, ['t']=-0.600655, ['s']=1.000000},
			{['c']='move',['p']=torso, ['a']=z_axis, ['t']=17.421551, ['s']=1.000000},
			{['c']='turn',['p']=torso, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=torso, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=torso, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='move',['p']=brazoi, ['a']=x_axis, ['t']=5.136546, ['s']=1.000000},
			{['c']='move',['p']=brazoi, ['a']=y_axis, ['t']=-0.766287, ['s']=1.000000},
			{['c']='move',['p']=brazoi, ['a']=z_axis, ['t']=16.084387, ['s']=1.000000},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=-0.000000, ['s']=1.000000},
			{['c']='move',['p']=brazo, ['a']=x_axis, ['t']=-5.187893, ['s']=1.000000},
			{['c']='move',['p']=brazo, ['a']=y_axis, ['t']=0.096845, ['s']=1.000000},
			{['c']='move',['p']=brazo, ['a']=z_axis, ['t']=16.097656, ['s']=1.000000},
			{['c']='turn',['p']=brazo, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=brazo, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=brazo, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=antebrazoi, ['a']=x_axis, ['t']=4.751583, ['s']=1.000000},
			{['c']='move',['p']=antebrazoi, ['a']=y_axis, ['t']=-0.211390, ['s']=1.000000},
			{['c']='move',['p']=antebrazoi, ['a']=z_axis, ['t']=20.554134, ['s']=1.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=mochila, ['a']=x_axis, ['t']=0.094849, ['s']=1.000000},
			{['c']='move',['p']=mochila, ['a']=y_axis, ['t']=-0.600656, ['s']=1.000000},
			{['c']='move',['p']=mochila, ['a']=z_axis, ['t']=17.421549, ['s']=1.000000},
			{['c']='turn',['p']=mochila, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=mochila, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=mochila, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=armadura, ['a']=x_axis, ['t']=0.060480, ['s']=1.000000},
			{['c']='move',['p']=armadura, ['a']=y_axis, ['t']=-0.951542, ['s']=1.000000},
			{['c']='move',['p']=armadura, ['a']=z_axis, ['t']=17.082560, ['s']=1.000000},
			{['c']='turn',['p']=armadura, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=armadura, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=armadura, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=pipa001, ['a']=x_axis, ['t']=-5.259491, ['s']=1.000000},
			{['c']='move',['p']=pipa001, ['a']=y_axis, ['t']=-1.659329, ['s']=1.000000},
			{['c']='move',['p']=pipa001, ['a']=z_axis, ['t']=9.554988, ['s']=1.000000},
			{['c']='turn',['p']=pipa001, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pipa001, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pipa001, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=pipa, ['a']=x_axis, ['t']=-5.259491, ['s']=1.000000},
			{['c']='move',['p']=pipa, ['a']=y_axis, ['t']=-1.894664, ['s']=1.000000},
			{['c']='move',['p']=pipa, ['a']=z_axis, ['t']=10.436335, ['s']=1.000000},
			{['c']='turn',['p']=pipa, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pipa, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=pipa, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='move',['p']=antebrazo, ['a']=x_axis, ['t']=-4.804696, ['s']=1.000000},
			{['c']='move',['p']=antebrazo, ['a']=y_axis, ['t']=-0.211390, ['s']=1.000000},
			{['c']='move',['p']=antebrazo, ['a']=z_axis, ['t']=20.554142, ['s']=1.000000},
			{['c']='turn',['p']=antebrazo, ['a']=x_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=antebrazo, ['a']=y_axis, ['t']=0.000000, ['s']=1.000000},
			{['c']='turn',['p']=antebrazo, ['a']=z_axis, ['t']=0.000000, ['s']=1.000000},
		}
	},
}


Animations['walkAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=pie, ['a']=x_axis, ['t']=-2.892862, ['s']=0.000000},
			{['c']='move',['p']=pie, ['a']=y_axis, ['t']=0.605459, ['s']=0.000000},
			{['c']='move',['p']=pie, ['a']=z_axis, ['t']=0.747936, ['s']=0.000000},
			{['c']='turn',['p']=pie, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pie, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pie, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=entrepiernai, ['a']=x_axis, ['t']=1.214576, ['s']=0.000000},
			{['c']='move',['p']=entrepiernai, ['a']=y_axis, ['t']=-0.084784, ['s']=0.000000},
			{['c']='move',['p']=entrepiernai, ['a']=z_axis, ['t']=12.077648, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=x_axis, ['t']=0.507470, ['s']=1.375125},
			{['c']='turn',['p']=entrepiernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pierna, ['a']=x_axis, ['t']=-2.458014, ['s']=0.000000},
			{['c']='move',['p']=pierna, ['a']=y_axis, ['t']=-0.355256, ['s']=0.000000},
			{['c']='move',['p']=pierna, ['a']=z_axis, ['t']=7.565501, ['s']=0.000000},
			{['c']='turn',['p']=pierna, ['a']=x_axis, ['t']=1.068901, ['s']=2.672253},
			{['c']='turn',['p']=pierna, ['a']=y_axis, ['t']=-0.000001, ['s']=0.000001},
			{['c']='turn',['p']=pierna, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=x_axis, ['t']=2.556551, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=y_axis, ['t']=-0.355256, ['s']=0.000000},
			{['c']='move',['p']=piernai, ['a']=z_axis, ['t']=7.565503, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=entrepiernad, ['a']=x_axis, ['t']=-1.213918, ['s']=0.000000},
			{['c']='move',['p']=entrepiernad, ['a']=y_axis, ['t']=-0.084784, ['s']=0.000000},
			{['c']='move',['p']=entrepiernad, ['a']=z_axis, ['t']=12.077648, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=x_axis, ['t']=-0.633954, ['s']=1.319857},
			{['c']='turn',['p']=entrepiernad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=x_axis, ['t']=3.260389, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=y_axis, ['t']=1.036430, ['s']=0.000000},
			{['c']='move',['p']=piei, ['a']=z_axis, ['t']=0.735140, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=x_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piei, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 12,
		['commands'] = {
			{['c']='turn',['p']=pierna, ['a']=x_axis, ['t']=-0.000000, ['s']=2.466695},
			{['c']='turn',['p']=pierna, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000001},
			{['c']='turn',['p']=pierna, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 25,
		['commands'] = {
			{['c']='turn',['p']=entrepiernai, ['a']=x_axis, ['t']=-0.638468, ['s']=1.375125},
			{['c']='turn',['p']=entrepiernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernai, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=1.111764, ['s']=2.565609},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000001},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000001, ['s']=0.000001},
			{['c']='turn',['p']=entrepiernad, ['a']=x_axis, ['t']=0.465926, ['s']=1.319857},
			{['c']='turn',['p']=entrepiernad, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=entrepiernad, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 38,
		['commands'] = {
			{['c']='turn',['p']=piernai, ['a']=x_axis, ['t']=0.000000, ['s']=2.779409},
			{['c']='turn',['p']=piernai, ['a']=y_axis, ['t']=0.000000, ['s']=0.000001},
			{['c']='turn',['p']=piernai, ['a']=z_axis, ['t']=0.000000, ['s']=0.000002},
		}
	},
	{
		['time'] = 50,
		['commands'] = {
		}
	},
}

Animations['moveTorsoAnimation'] = {
	{
		['time'] = 0,
		['commands'] = {
			{['c']='move',['p']=antebrazo, ['a']=x_axis, ['t']=-4.804696, ['s']=0.000000},
			{['c']='move',['p']=antebrazo, ['a']=y_axis, ['t']=-0.211390, ['s']=0.000000},
			{['c']='move',['p']=antebrazo, ['a']=z_axis, ['t']=20.554142, ['s']=0.000000},
			{['c']='turn',['p']=antebrazo, ['a']=x_axis, ['t']=0.263769, ['s']=1.149875},
			{['c']='turn',['p']=antebrazo, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=antebrazo, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=brazoi, ['a']=x_axis, ['t']=5.136546, ['s']=0.000000},
			{['c']='move',['p']=brazoi, ['a']=y_axis, ['t']=-0.766287, ['s']=0.000000},
			{['c']='move',['p']=brazoi, ['a']=z_axis, ['t']=16.084387, ['s']=0.000000},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=-0.092394, ['s']=0.181382},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='move',['p']=pipa001, ['a']=x_axis, ['t']=-5.259491, ['s']=0.000000},
			{['c']='move',['p']=pipa001, ['a']=y_axis, ['t']=-1.659329, ['s']=0.000000},
			{['c']='move',['p']=pipa001, ['a']=z_axis, ['t']=9.554988, ['s']=0.000000},
			{['c']='turn',['p']=pipa001, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pipa001, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pipa001, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=brazo, ['a']=x_axis, ['t']=-5.187893, ['s']=0.000000},
			{['c']='move',['p']=brazo, ['a']=y_axis, ['t']=0.096845, ['s']=0.000000},
			{['c']='move',['p']=brazo, ['a']=z_axis, ['t']=16.097656, ['s']=0.000000},
			{['c']='turn',['p']=brazo, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=brazo, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=brazo, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=pipa, ['a']=x_axis, ['t']=-5.259491, ['s']=0.000000},
			{['c']='move',['p']=pipa, ['a']=y_axis, ['t']=-1.894664, ['s']=0.000000},
			{['c']='move',['p']=pipa, ['a']=z_axis, ['t']=10.436335, ['s']=0.000000},
			{['c']='turn',['p']=pipa, ['a']=x_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pipa, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=pipa, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='move',['p']=antebrazoi, ['a']=x_axis, ['t']=4.751583, ['s']=0.000000},
			{['c']='move',['p']=antebrazoi, ['a']=y_axis, ['t']=-0.211390, ['s']=0.000000},
			{['c']='move',['p']=antebrazoi, ['a']=z_axis, ['t']=20.554134, ['s']=0.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=x_axis, ['t']=-0.582290, ['s']=1.130575},
			{['c']='turn',['p']=antebrazoi, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 25,
		['commands'] = {
			{['c']='turn',['p']=antebrazo, ['a']=x_axis, ['t']=-0.694460, ['s']=1.149875},
			{['c']='turn',['p']=antebrazo, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=antebrazo, ['a']=z_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=brazoi, ['a']=x_axis, ['t']=-0.243545, ['s']=0.181382},
			{['c']='turn',['p']=brazoi, ['a']=y_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=brazoi, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=x_axis, ['t']=0.359856, ['s']=1.130575},
			{['c']='turn',['p']=antebrazoi, ['a']=y_axis, ['t']=0.000000, ['s']=0.000000},
			{['c']='turn',['p']=antebrazoi, ['a']=z_axis, ['t']=-0.000000, ['s']=0.000000},
		}
	},
	{
		['time'] = 50,
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
		PlayAnimation('walkAnimation')
		Sleep(0)
	end
end

local function MoveTorso()
	Signal(SIG_WALK1)
	SetSignalMask(SIG_WALK1)
	while true do
		if not isShooting then
			PlayAnimation('moveTorsoAnimation')
		end
		Sleep(0)
	end
end

local function RestorePose()
	Signal(SIG_WALK)
	Signal(SIG_WALK1)
	SetSignalMask(SIG_WALK)
	SetSignalMask(SIG_WALK1)
	PlayAnimation('restoreLegsAnimation')
end

local function RestorePoseTorso()
	Signal(SIG_RESTORE)
	SetSignalMask(SIG_RESTORE)
	Sleep(RESTORE_DELAY_SHOOT)
	if not isShooting then
		PlayAnimation('restoreTorsoAnimation')
	end
	isShooting = false
	aimWeapon = false
end

function script.StartMoving(heading)
	
	StartThread (Walk)
	StartThread (MoveTorso)
end

function script.StopMoving()
	isMoving = false
	StartThread(RestorePoseTorso)
	StartThread(RestorePose)
end


---AIMING & SHOOTING---

function script.Shot(num)
	--Spring.Echo(num)
end

function script.AimFromWeapon()
	return pipa
end

function script.QueryWeapon() 
	return flare
end
--must return true to allow the weapon to shot. return false denies the weapon from shooting
--can be used delay the shooting until a "turn turret" animation is completed

function script.AimWeapon(num, heading, pitch )
	Turn(torso, z_axis, heading,  math.rad(180))
	Turn(brazo, x_axis, -pitch-1.6, math.rad(180))
	WaitForTurn(brazo, x_axis)
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
