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

-- SYNCED only
if not gadgetHandler:IsSyncedCode() then
	return
end
