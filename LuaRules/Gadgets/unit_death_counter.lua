function gadget:GetInfo()
	return {
		name      = "Unit death",
		desc      = "counts dead units.",
		author      = "TurBoss",
		date      = "3/2/2015",
		license      = "GNU GPL V2 or Later",
		layer      = 5,
		enabled      = true  -- loaded by default?
	}
	end

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

local unitDestroyedCounterA = 0
local unitDestroyedCounterB = 0

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	if ((attackerTeam == 0) and ( attackerTeam ~= unitTeam)) then
		unitDestroyedCounterA = unitDestroyedCounterA +1
	elseif ((attackerTeam == 1) and ( attackerTeam ~= unitTeam)) then
		unitDestroyedCounterB = unitDestroyedCounterB +1
	end
	Spring.SetGameRulesParam("unitDestroyedCounterA", unitDestroyedCounterA)
	Spring.SetGameRulesParam("unitDestroyedCounterB", unitDestroyedCounterB)
end

function gadget:Initialize()
	Spring.SetGameRulesParam("unitDestroyedCounterA", unitDestroyedCounterA)
	Spring.SetGameRulesParam("unitDestroyedCounterB", unitDestroyedCounterB)
end
