function widget:GetInfo()
	return {
		name		= "Game Time",
		desc		= "Shows game time.",
		author		= "TurBoss",
		date		= "11/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true,  -- loaded by default?
	}
end

local spGetViewGeometry	= Spring.GetViewGeometry

local screenSizeX, screenSizeY	= spGetViewGeometry()

local Chili
local black	= {0.1, 0.1, 0.1, 1.0}
local grey	= {0.5, 0.5, 0.5, 1.0}
local white	= {1.0, 1.0, 1.0, 1.0}
local red	= {0.8, 0.0, 0.0, 1.0}


local timeWindow = {}
local timePanel, timeLabel

local function CreateWindow()
	timeWindow	= Chili.Window:New{
		parent		= Chili.Screen0;
		name		= "time window";
		x			= "42%";
		y			= 0;
		width		= "15%";
		height		= "10%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
		padding		= {2,2,2,2};
		children	= {
			Chili.Label:New{
				valign		= 'center';
				halign		= 'center';
				caption	= "Time";
				y		= "6%";
				x		= "40%";
				fontsize = math.floor(screenSizeX/75);
			},
		},
	}
	
	timerPanel	= Chili.Panel:New{
		parent		= timeWindow;
		name		= "timer";
		padding 	= {10,10,10,10};
		x			= "10%";
		y			= "35%";
		width		= "80%";
		height		= "60%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
	}
	
end

function UpdateTimer()
	timerLabel	= Chili.Label:New{
		parent		= timerPanel;
		name		= "timer label";
		caption		= "10:00";
		fontsize	= math.floor(screenSizeX/50);
		padding 	= {0,0,0,0};
		valign		= 'center';
		halign		= 'center';
		x			= "30%";
		y			= "25%";
		width		= "40%";
		height		= "55%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
	}
end

function widget:Initialize()
	Chili = WG.Chili
	
	if (not Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
	CreateWindow()
	UpdateTimer()
end
