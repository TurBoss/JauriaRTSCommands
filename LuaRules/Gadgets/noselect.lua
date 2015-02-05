function gadget:GetInfo()
	return {
		name      = "noselect",
		desc      = "noselect",
		author    = "TurBoss",
		date      = "14-7-2014",
		license   = "GNU GPL v2 or later",
		layer     = 1, 
		enabled   = true  --  loaded by default?
	}
end

-- synced only
if (not gadgetHandler:IsSyncedCode()) then
	return false
end

function gadget:GameStart()
	local units = Spring.GetAllUnits()
	for i, unit in pairs(units) do
		--Spring.Echo(unit)
		if Spring.GetUnitDefID(unit) == UnitDefNames.startflag.id then
		Spring.SetUnitAlwaysVisible (unit,true)
		Spring.SetUnitNoSelect (unit, true)
		Spring.SetUnitNeutral (unit, true)
		end
	end
end
