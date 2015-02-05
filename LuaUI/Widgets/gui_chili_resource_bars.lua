--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Remove resource bars",
    desc      = "",
    author    = "TurBoss",
    date      = "5/2/2015",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Initialize()
	Spring.SendCommands("resbar 0")
end

function widget:Shutdown()
	Spring.SendCommands("resbar 1")
end
