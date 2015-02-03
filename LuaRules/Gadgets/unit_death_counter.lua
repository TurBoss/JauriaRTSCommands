function gadget:GetInfo()
	return {
		name		= "Unit death counter",
		desc		= "counts dead units.",
		author		= "TurBoss",
		date		= "3/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 0,
		enabled		= true  -- loaded by default?
	}
end

if (gadgetHandler:IsSyncedCode()) then
	
	function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
		SendToUnsynced("DeathEvent", unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	end
	
else
	
	function WrapToLuaUI(_, unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
		if (Script.LuaUI('DeathEvent')) then
			Script.LuaUI.DeathEvent(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
		end
	end
	
	function gadget:Initialize()
		gadgetHandler:AddSyncAction("DeathEvent", WrapToLuaUI)
	end
	
	function gadget:ShutDown()
		gadgetHandler:RemoveSyncAction("DeathEvent")
	end
	
end
