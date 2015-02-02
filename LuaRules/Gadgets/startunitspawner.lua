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

local DelayCall = GG.Delay.DelayCall

local	spIsCheatingEnabled	= Spring.IsCheatingEnabled
local	spCreateUnit		= Spring.CreateUnit

local startflagUID = 0

-- SYNCED only
if not gadgetHandler:IsSyncedCode() then
	return
end

function gadget:Initialize()
end

function CreateUnit(selectedUnitDefId, playerID)
	local _,_,_,teamID = Spring.GetPlayerInfo(playerID)
	
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
	
	flagX = flagX + math.random (20,30)
	flagZ = flagZ + math.random (20,30)
	
	spCreateUnit(	unitName, flagX, flagY, 
							flagZ, 0, teamID)
end

function gadget:RecvLuaMsg(msg, playerID)
	if (msg:sub(1,18) == 'selectedstartunit:') then
		
		local selectedUnitDefId		= tonumber(msg:sub(19))
		DelayCall(CreateUnit, {selectedUnitDefId, playerID}, 90)
		--CreateUnit(selectedUnitDefId, playerID)
	end
end
