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

local Teams = Spring.GetTeamList()

local unitDestroyedCounterA = 0
local unitDestroyedCounterB = 0

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)

	if unitDefID == UnitDefNames.mine.id then
		return
	end
	
	if ((attackerTeam == Teams[1]) and ( attackerTeam ~= unitTeam)) then
		Spring.Echo("Team1")
		unitDestroyedCounterA = unitDestroyedCounterA +1
		Spring.SetGameRulesParam("unitDestroyedCounterA", unitDestroyedCounterA)
	elseif ((attackerTeam == Teams[2]) and ( attackerTeam ~= unitTeam)) then
		Spring.Echo("Team2")
		unitDestroyedCounterB = unitDestroyedCounterB +1
		Spring.SetGameRulesParam("unitDestroyedCounterB", unitDestroyedCounterB)
	end
end

function gadget:Initialize()
	Spring.SetGameRulesParam("unitDestroyedCounterA", unitDestroyedCounterA)
	Spring.SetGameRulesParam("unitDestroyedCounterB", unitDestroyedCounterB)
end
