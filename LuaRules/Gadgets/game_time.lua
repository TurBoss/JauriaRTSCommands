function gadget:GetInfo()
    return {
        name    = "Game Time",
        desc    = "Game Time Counter",
        author  = "TurBoss",
        date    = "11/02/2015",
        license = "GNU GPL ver 2 or later",
        version = "0.1",
        layer   = 82,
        enabled = true
    }
end
local timer = 600 --seconds
-- SYNCED only
if not gadgetHandler:IsSyncedCode() then
	return
end

function gadget:GameFrame(f)
	if (f % 30 ==0) then
		if timer == 0 then
			return
		else
			timer = timer -1
		end
		Spring.SetGameRulesParam("GameTimer", timer)
	end
end
