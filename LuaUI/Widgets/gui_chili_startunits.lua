function widget:GetInfo()
	return {
		name		= "Start Units",
		desc		= "spawns start units.",
		author		= "TurBoss",
		date		= "1/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true,  -- loaded by default?
	}
end

local kortus		= UnitDefNames.kortus
local carson		= UnitDefNames.carson
local franco		= UnitDefNames.franco
local asesino		= UnitDefNames.asesino
local soldado		= UnitDefNames.soldado
local heikthief		= UnitDefNames.heikthief

local units = {
	carson,
	franco,
	asesino,
	soldado,
	heikthief,
	kortus,
}

local selected = {
}

local update = 0
local index = 1

local tooltip = 0

local spGetViewGeometry	= Spring.GetViewGeometry
local spSendLuaRulesMsg	= Spring.SendLuaRulesMsg
local speccing = Spring.GetSpectatingState()

local screenSizeX, screenSizeY	= spGetViewGeometry()
local Chili
local black	= {0.1, 0.1, 0.1, 1.0}
local grey	= {0.5, 0.5, 0.5, 1.0}
local white	= {1.0, 1.0, 1.0, 1.0}
local red	= {0.8, 0.0, 0.0, 1.0}


local spawnerWindow, spawnerPanel, selectedPanel

local unitSpawnButtons = {}
local unitSelectedButtons = {}

local function CreateTooltip()

	if tooltip == 0 then
		errorWindow	= Chili.Window:New{
			parent		= Chili.Screen0;
			name		= "tooltip";
			x			= "40%";
			y			= "45%";
			width		= "20%";
			height		= "10%";
			dockable	= false;
			draggable	= false;
			resizable	= false;
			padding		= {2,2,2,2};
			children	= {
				Chili.Label:New{
					caption	= "Choose your units";
					y		= "10%";
					x		= "10%";
					fontsize = math.floor(screenSizeX/75);
				},
			},
		}
		
		errorButton		= Chili.Button:New{
			width = 80,
			height = 30,
			y = "46%",
			x = "40%",
			parent=errorWindow;
			padding = {0, 0, 0,0},
			margin = {0, 0, 0, 0},
			backgroundColor = {1, 1, 1, 1},
			caption = "Ok",
			tooltip = "Start";
			OnClick = {
				function()
					errorWindow:Dispose()
					errorWindow = nil
					tooltip = 0
				end
			}
		}
		tooltip = 1
	end
end

local function CreateWindow()
	spawnerWindow	= Chili.Window:New{
		parent		= Chili.Screen0;
		name		= "main window";
		x			= "30%";
		y			= "25%";
		width		= "40%";
		height		= "45%";
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
			Chili.Label:New{
				caption	= "Selected units";
				y		= "46%";
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
		y			= "16%";
		width		= "95%";
		height		= "25%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
	}
	
	selectedPanel	= Chili.Panel:New{
		parent		= spawnerWindow;
		name		= "selected unit list";
		padding 	= {10,10,10,10};
		x			= "2.5%";
		y			= "56%";
		width		= "95%";
		height		= "25%";
		dockable	= false;
		draggable	= false;
		resizable	= false;
	}
	clearButton		= Chili.Button:New{
		width = 80,
		height = 30,
		y = "86%",
		x = "60%",
		parent=spawnerWindow;
		padding = {0, 0, 0,0},
		margin = {0, 0, 0, 0},
		backgroundColor = {1, 1, 1, 1},
		caption = "Clear",
		tooltip = "Clear the selected units";
		OnClick = {
			function()
				
				for i,unitDef in pairs(selected) do

					if unitSelectedButtons[i] then
						unitSelectedButtons[i]:Dispose()
						unitSelectedButtons[i] = nil
					end
				end
				index = 1
				selected = {}
			end
		}
	}
	okButton		= Chili.Button:New{
		width = 80,
		height = 30,
		y = "86%",
		x = "80%",
		parent=spawnerWindow;
		padding = {0, 0, 0,0},
		margin = {0, 0, 0, 0},
		backgroundColor = {1, 1, 1, 1},
		caption = "Ok",
		tooltip = "Start";
		OnClick = {
			function()
				if index == 7 then
					spawnerWindow:Dispose()
					spawnerWindow = nil
					
					for ind,data in ipairs(selected) do
						spSendLuaRulesMsg('selectedstartunit:' .. data.id)
					end
				else
					CreateTooltip()
				end
			end
		}
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
					if index <= 6 then
						selected[#selected+1] = unitDef
						index = index + 1
						update = 1
					end
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

local function BuildSelectedButtons()
	local colorCollumns	= 100
	local colCount		= 0
	local counterY		= 0
	local counterX		= 0
	local basesize		= screenSizeX/22
	local textSize		= math.floor(screenSizeX/120)
	
	for i,unitDef in pairs(selected) do
	
		if unitSelectedButtons[i] then
			unitSelectedButtons[i]:Dispose()
			unitSelectedButtons[i] = nil
		end
		
		local gridXPos		=	screenSizeX/ 19 * counterX
		local gridYPos		=	screenSizeX/ 19 * counterY
		
		unitSelectedButtons[i]	= Chili.Panel:New{
			parent				= selectedPanel;
			tooltip				= unitDef.humanName or "";
			caption				= unitDef.name or "";
			x					= gridXPos;
			y					= gridYPos;
			width				= basesize;
			height				= basesize;
			fontsize			= textSize;
			--[[OnClick = { 
				function()
					
					if unitSelectedButtons[i] then
						--selectedPanel:RemoveChild(unitSelectedButtons[i])
						unitSelectedButtons[i]:Dispose()
						unitSelectedButtons[i] = nil
					end
					
					table.remove(selected,index)
					index = index - 1
					counterX = counterX - 1
					update = 1
					if index < 1 then
						index = 1
					end
					
				end
			};]]--
			children = {
				Chili.Image:New{
					file	= ":cl:UnitPics/" .. unitDef.buildpicname;
					--color	= grey;
					x		= "7%";
					y		= "7%";
					width	= "90%";  
					height	= "90%";
				}
			};
		}
		counterX = counterX + 1
	end
end

function widget:Initialize()
	Chili = WG.Chili
	
	if (not Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
	--CreateWindow()
	--BuildUnitButtons()
end

function widget:Update()
	if update == 1 then
		BuildSelectedButtons()
		update = 0
	end
end

function widget:GameStart()
	if not speccing then
		CreateWindow()
		BuildUnitButtons()
	end
end
