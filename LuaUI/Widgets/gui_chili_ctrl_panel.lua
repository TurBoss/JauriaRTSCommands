function widget:GetInfo()
	return {
		name		= "Control Panel",
		desc		= "Allow resign and quit",
		author		= "TurBoss",
		date		= "2014-07-11",
		license		= "GNU GPL v2 or later",
		layer		= 0,
		enabled		= true  --  loaded by default?
	}
end

-- INCLUDES
-- CONSTANTS
local DEBUG = true

local speccing = Spring.GetSpectatingState()
-- MEMBERS

local Chili
local Label
local Window

-- SCRIPT FUNCTIONS

function widget:Initialize()
	if (not WG.Chili) then
		widgetHandler:RemoveWidget()
		return
	end
	
	Chili = WG.Chili
	if not speccing then
		CreateWindow()
	else
		CreateSpecWindow()
	end
	
	
end

function CreateWindow()
	
	local screen0 = Chili.Screen0
	
	ctrlWindow = Chili.Window:New{
		x = 0,
		y = 220,
		align="right";
		valign="top";
		dockable = true,
		parent = screen0,
		caption = '',
		draggable = true,
		resizable = false,
		dragUseGrip = true,
		clientWidth = 180,
		clientHeight = 55,
		backgroundColor = {0.8,0.8,0.8,0.9},
		
		children = {
			Chili.Label:New{
				caption	= "Control Panel";
				y		= 0;
				x		= 0;
				fontsize = 14;
			},
			Chili.Button:New {
				parent				= ctrlWindow;
				tooltip				= "Resign";
				caption				= "Resign";
				x					= 0;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						if resignWindow == nil then
							CreateResignWindow()
						end
					end
				},
			},
			Chili.Button:New {
				parent				= ctrlWindow;
				tooltip				= "Quit";
				caption				= "Quit";
				x					= 90;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						if exitWindow == nil then
							CreateExitWindow()
						end
					end
				},
			},
		},
	}
	
end

function CreateSpecWindow()
	
	local screen0 = Chili.Screen0
	
	ctrlSpecWindow = Chili.Window:New{
		x = 0,
		y = 220,
		align="right";
		valign="top";
		dockable = true,
		parent = screen0,
		caption = '',
		draggable = true,
		resizable = false,
		dragUseGrip = true,
		clientWidth = 180,
		clientHeight = 55,
		backgroundColor = {0.8,0.8,0.8,0.9},
		
		children = {
			Chili.Label:New{
				caption	= "Control Panel";
				y		= 0;
				x		= 0;
				fontsize = 14;
			},
			Chili.Button:New {
				parent				= ctrlSpecWindow;
				tooltip				= "Quit";
				caption				= "Quit";
				x					= 90;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						if exitSpecWindow == nil then
							CreateExitSpecWindow()
						end
					end
				},
			},
		},
	}
	
end

function CreateResignWindow()
	
	local screen0 = Chili.Screen0
	
	resignWindow = Chili.Window:New{
		x = '40%',
		y = '40%',
		align="center";
		valign="center";
		dockable = true,
		parent = screen0,
		caption = '',
		draggable = false,
		resizable = false,
		dragUseGrip = false,
		clientWidth = 180,
		clientHeight = 55,
		backgroundColor = {0.8,0.8,0.8,0.9},
		
		children = {
			Chili.Label:New{
				caption	= "Resign?";
				y		= 0;
				x		= 0;
				fontsize = 14;
			},
			Chili.Button:New {
				parent				= resignWindow;
				tooltip				= "Yes";
				caption				= "Yes";
				x					= 0;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						resign()
					end
				},
			},
			Chili.Button:New {
				parent				= resignWindow;
				tooltip				= "No";
				caption				= "No";
				x					= 90;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						DestroyResignWindow()
					end
				},
			},
		},
	}
end

function CreateExitWindow()
	
	local screen0 = Chili.Screen0
	
	exitWindow = Chili.Window:New{
		x = '40%',
		y = '40%',
		align="center";
		valign="center";
		dockable = false,
		parent = screen0,
		caption = '',
		draggable = false,
		resizable = false,
		dragUseGrip = false,
		clientWidth = 180,
		clientHeight = 55,
		backgroundColor = {0.8,0.8,0.8,0.9},
		
		children = {
			Chili.Label:New{
				caption	= "Exit?";
				y		= 0;
				x		= 0;
				fontsize = 14;
			},
			Chili.Button:New {
				parent				= exitWindow;
				tooltip				= "Yes";
				caption				= "Yes";
				x					= 0;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						quit()
					end
				},
			},
			Chili.Button:New {
				parent				= exitWindow;
				tooltip				= "No";
				caption				= "No";
				x					= 90;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						DestroyExitWindow()
					end
				},
			},
		},
	}
end

function CreateExitSpecWindow()
	
	local screen0 = Chili.Screen0
	
	exitSpecWindow = Chili.Window:New{
		x = '40%',
		y = '40%',
		align="center";
		valign="center";
		dockable = false,
		parent = screen0,
		caption = '',
		draggable = false,
		resizable = false,
		dragUseGrip = false,
		clientWidth = 180,
		clientHeight = 55,
		backgroundColor = {0.8,0.8,0.8,0.9},
		
		children = {
			Chili.Label:New{
				caption	= "Exit?";
				y		= 0;
				x		= 0;
				fontsize = 14;
			},
			Chili.Button:New {
				parent				= exitSpecWindow;
				tooltip				= "Yes";
				caption				= "Yes";
				x					= 0;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						quitSpec()
					end
				},
			},
			Chili.Button:New {
				parent				= exitSpecWindow;
				tooltip				= "No";
				caption				= "No";
				x					= 90;
				y					= 15;
				width				= 80;
				height				= 40;
				fontsize			= 14;
				OnClick = {
					function()
						DestroyExitSpecWindow()
					end
				},
			},
		},
	}
end

function DestroyExitWindow()
	exitWindow:Dispose()
	exitWindow = nil
end

function DestroyExitSpecWindow()
	exitSpecWindow:Dispose()
	exitSpecWindow = nil
end

function DestroyResignWindow()
	resignWindow:Dispose()
	resignWindow = nil
end

function resign()
	local playerlist = Spring.GetPlayerList()
	local team = Spring.GetMyTeamID()
	
	for i=1, #playerlist do
		local playerID = playerlist[i]
		if playerID ~= team then
			Spring.SendLuaRulesMsg('resign' .. playerID)
		end
	end
end

function quit()
	local playerlist = Spring.GetPlayerList()
	local team = Spring.GetMyTeamID()
	
	for i=1, #playerlist do
		local playerID = playerlist[i]
		if playerID ~= team then
			Spring.SendLuaRulesMsg('quit' .. playerID)
		end
	end
end

function quitSpec()
	Spring.SendCommands('quit')
	Spring.SendCommands('quitforce')
end
