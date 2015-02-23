function widget:GetInfo()
	return {
		name		= "End Siren",
		desc		= "Alerts game end.",
		author		= "TurBoss",
		date		= "16/2/2015",
		license		= "GNU GPL V2 or Later",
		layer		= 5,
		enabled		= true,  -- loaded by default?
	}
end

local alertTime = 15
local enableSiren = false
local gameOver = false

local function playSiren()
	Spring.PlaySoundFile("siren")
end

function widget:GameOver()
	gameOver = true
end

function widget:GameFrame(f)
	if (f % 30 == 0) then 
		timer = Spring.GetGameRulesParam("GameTimer")
		if timer < alertTime and not (gameOver) then
			enableSiren = true
		else
			enableSiren = false
		end
	end
	if (f % 60 == 0)and enableSiren then
		playSiren()
	end
end
