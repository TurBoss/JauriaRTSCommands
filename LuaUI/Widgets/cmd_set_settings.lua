function widget:GetInfo()
	return {
		name      = "Los settings and move colors",
		desc      = "Widget to set various settings on game start",
		author    = "TurBoss",
		date      = "14-7-2014",
		license   = "GNU GPL v2 or later",
		layer     = 1, 
		enabled   = true  --  loaded by default?
	}
end

function widget:Initialize()
	--Spring.SendCommands("bind f4 showmetalmap")
	--Spring.SendCommands("bind d manualfire")
	
	Spring.SendCommands("togglelos 1")
	Spring.SendCommands("toggleradarandjammer 1")
	
	Spring.LoadCmdColorsConfig('move  0.5 1.0 0.5 0.0')
	
	widgetHandler:RemoveWidget(self)
end
