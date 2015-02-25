function gadget:GetInfo()
	return {
		name		= "Start Unit spawner",
		desc		= "spawns units at game start.",
		author		= "TurBoss",
		date		= "1/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true  -- loaded by default?
	}
end

-- SYNCED only
if not gadgetHandler:IsSyncedCode() then
	return
end

local DelayCall = GG.Delay.DelayCall

local	spCreateUnit		= Spring.CreateUnit

local Teams = Spring.GetTeamList()

local startflagUID = 0

local unitsCounterA = 0
local unitsCounterB = 0

function gadget:Initialize()
end

function CreateUnit(selectedUnitDefId, teamID, playerID)

	--Spring.Echo("Create Unit " .. selectedUnitDefId .. " for " .. teamID)
	
	local unitDefId			= selectedUnitDefId
	local unitName			= UnitDefs[unitDefId].name
	
	local units = Spring.GetTeamUnits(teamID)
	for i,u in ipairs(units) do
		local uDID = Spring.GetUnitDefID(u)
		if UnitDefs[uDID].name == "startflag" then
			startflagUID = u
		end
	end
	
	local flagX, flagY, flagZ = Spring.GetUnitPosition(startflagUID)
	
	flagX = flagX + math.random (20,100)
	flagZ = flagZ + math.random (20,100)
	
	--Spring.MarkerAddPoint(flagX, flagY, flagZ)
	spCreateUnit(	unitName, flagX, flagY, 
							flagZ, 0, teamID)
end


function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	if unitDefID == UnitDefNames.mine.id then
		return
	end
	
	
	if unitTeam == Teams[1] then
		unitsCounterA = unitsCounterA - 1
		if unitsCounterA < 0 then unitsCounterA = 0 end
		--Spring.Echo("Unit Down ".. unitsCounterA)
	elseif unitTeam == Teams[2] then
		unitsCounterB = unitsCounterB - 1
		if unitsCounterB < 0 then unitsCounterB = 0 end
		--Spring.Echo("Unit Down ".. unitsCounterB)
	end
	
end

function gadget:RecvLuaMsg(msg, playerID)
	if (msg:sub(1,18) == 'selectedstartunit:') then
		
		local teamID				= select(4,Spring.GetPlayerInfo(playerID))
		
		local selectedUnitDefId		= tonumber(msg:sub(19))
		
		--Spring.Echo(TeamID)
		--Spring.Echo(Teams[1])
		
		if teamID == Teams[1] then
			unitsCounterA = unitsCounterA + 1
			Spring.Echo(teamID .. " - " .. unitsCounterA)
		elseif teamID == Teams[2] then
			unitsCounterB = unitsCounterB + 1
			Spring.Echo(teamID .. " - " .. unitsCounterB)
		end
		
		if unitsCounterA <= 6 and teamID == Teams[1] then
		
			DelayCall(CreateUnit, {selectedUnitDefId, teamID, playerID}, 90)
			
		elseif unitsCounterB <= 6 and teamID == Teams[2] then
		
			DelayCall(CreateUnit, {selectedUnitDefId, teamID, playerID}, 90)
			
		end
	end
end

function gadget:GameOver()
	gadgetHandler:RemoveGadget()
end
