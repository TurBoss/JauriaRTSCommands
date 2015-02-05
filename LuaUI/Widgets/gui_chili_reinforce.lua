function widget:GetInfo()
	return {
		name		= "Reinforce Units",
		desc		= "spawns reinforce units.",
		author		= "TurBoss",
		date		= "1/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true,  -- loaded by default?
	}
end

local artillero		= UnitDefNames.artillero
local franco		= UnitDefNames.franco
local asesino		= UnitDefNames.asesino
local soldado		= UnitDefNames.soldado
local heikthief		= UnitDefNames.heikthief

local mina 			= UnitDefNames.mina.id

local units = {
	artillero,
	franco,
	asesino,
	soldado,
	heikthief,
}

local selected = {
}

local update = 0
local index = 0


local spGetViewGeometry	= Spring.GetViewGeometry
local spSendLuaRulesMsg	= Spring.SendLuaRulesMsg

local screenSizeX, screenSizeY	= spGetViewGeometry()
local Chili
local black	= {0.1, 0.1, 0.1, 1.0}
local grey	= {0.5, 0.5, 0.5, 1.0}
local white	= {1.0, 1.0, 1.0, 1.0}
local red	= {0.8, 0.0, 0.0, 1.0}


local spawnerWindow = {}
local spawnerPanel

local unitSpawnButtons = {}

local function CreateWindow()
	spawnerWindow	= Chili.Window:New{
		parent		= Chili.Screen0;
		name		= "main window"..index;
		x			= "30%";
		y			= "25%";
		width		= "40%";
		height		= "20%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
		padding		= {2,2,2,2};
		children	= {
			Chili.Label:New{
				caption	= "Choose your units";
				y		= "6%";
				x		= "7.5%";
				fontsize = math.floor(screenSizeX/75);
			},
		},
	}
	
	spawnerPanel	= Chili.ScrollPanel:New{
		parent		= spawnerWindow;
		name		= "unit list";
		padding 	= {10,10,10,10};
		x			= "2.5%";
		y			= "20%";
		width		= "95%";
		height		= "55%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
	}
	
	
end

local function BuildUnitButtons()
	local colorCollumns	= 100
	local colCount		= 0
	local counterY		= 0
	local counterX		= 0
	local basesize		= screenSizeX/22
	local textSize		= math.floor(screenSizeX/120)
	
	for i,unitDef in pairs(units) do
		local gridXPos		=	screenSizeX/ 19 * counterX
		local gridYPos		=	screenSizeX/ 19 * counterY
		unitSpawnButtons[i]	= Chili.Button:New{
			parent				= spawnerPanel;
			tooltip				= unitDef.humanName or "";
			caption				= unitDef.name or "";
			x					= gridXPos;
			y					= gridYPos;
			width				= basesize;
			height				= basesize;
			fontsize			= textSize;
			OnClick = { 
				function()
					
					index = index -1
					if index == 0 then
						spawnerWindow:Dispose()
						spawnerWindow = nil
					end
					
					
					spSendLuaRulesMsg('selectedstartunit:' .. unitDef.id)
				end
			};
			children = {
				Chili.Image:New{
					file	= ":cl:UnitPics/" .. unitDef.buildpicname;
					--color	= grey;
					x		= 0;
					y		= 0;
					width	= "100%";  
					height	= "100%";
				}
			};
		}
		counterX = counterX + 1
		if(math.floor(counterX/6) == 1) then
			counterY = counterY + 1
			counterX = 0
		end	
	end
end

function widget:Initialize()
	Chili = WG.Chili
	
	if (not Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
end

function widget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	if unitDefID == mina then
		return
	end

	if unitTeam == Spring.GetMyTeamID() then
		if index == 0 then
			CreateWindow()
			BuildUnitButtons()
		end
		index = index + 1
	end
end
